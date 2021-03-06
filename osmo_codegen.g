grammar osmo_codegen;

options {
	//language = Python;
	output = AST;
}
tokens {
	PDUFIELD_OPT;
	FIELD_VAL;
	PDUFIELD_SIZE;
	IEFIELD_ENDIAN;
	IEFIELD_COND;
	
	IE_SPECS;
	IE_ALIASES;
	PDU_SPECS;
}

root	:	
	  (pdu_spec | ie_spec | ie_alias)*
	  				-> ^(IE_SPECS ie_spec*) 
	  				   ^(IE_ALIASES ie_alias*)
	  				   ^(PDU_SPECS pdu_spec*)
	;
	
/* INFORMATION ELEMENTS */

/* An alias in the form "ie_alias new_name existing_field" */
ie_alias:	'ie_alias' ie_name ie_name
					-> ^(ie_name ie_name)
	;

ie_name	:	ID;

ie_spec	:	'ie_spec' ID
			ie_field_def*
		'end_ie_spec'
					-> ^(ID ie_field_def*)
		;

ie_field_def
	:	ie_field_name ie_field_len ie_field_type ie_field_opt*
					-> ^(ie_field_name ie_field_type ie_field_len ie_field_opt*)
	;

ie_field_name
	:	ID;
ie_field_len
	:	(NUMERIC
		| '*'		// * only permitted in last field, menas 'all remaining octets/bits'
		);
ie_field_type
	:	('byte' | 'bytes'
		| 'bit' | 'bits'
		| 'bcd'		// BCD digits, always 'lower nibble, upper nibble, lower nibble, ...
		);
ie_field_opt
	:	(field_val | ie_field_cond | ie_field_endian | ie_field_enum)
	;
ie_field_cond
	:	'if (' ie_field_name ('&' ie_field_cond_mask)? COMP_OP ie_field_cond_reference ')'
					-> ^(IEFIELD_COND ie_field_name ie_field_cond_mask? COMP_OP ie_field_cond_reference)
	;
ie_field_cond_mask
	:	NUMERIC;
ie_field_cond_reference
	:	NUMERIC;
ie_field_endian
	:	( 'big'			-> ^(IEFIELD_ENDIAN 'big')
		| 'little'		-> ^(IEFIELD_ENDIAN 'little')
		)
	;
ie_field_enum
	:	'enum' ID		-> ^('enum' ID)
	;
	

/* PDU DEFINITIONS*/

pdu_spec
	: 	'pdu_spec' ID 
			pdu_field_def*
		'end_pdu_spec'		-> ^(ID pdu_field_def*)
	;

pdu_field_mode
	:	'mand' | 'opt' | 'cond';

field_val
	:	('val'|'value') NUMERIC		// Field always has to have indicated value
					-> ^(FIELD_VAL NUMERIC)
	;

field_tag
	:	'tag' NUMERIC			// for tagged fields
					-> ^('tag' NUMERIC)
	;

pdu_field_size
	:	NUMERIC ('-' NUMERIC)?	 	// fixed length or range
					-> ^(PDUFIELD_SIZE NUMERIC*)
	;

pdu_field_opts
	:	pdu_up_downlink | pdu_opt_ie | pdu_opt_enum
	;
pdu_up_downlink
	:	'uplink_only' | 'downlink_only'; // only valid in uplink or downlink
pdu_opt_ie
	:	'ie' ID				// use speciifed IE definition
					-> ^('ie' ID)
	;
pdu_opt_enum
	:	'enum' ID
					-> ^('enum' ID)
	;

pdu_field_type
	:	(
		('V4u' 			field_val?)		// 4 bits in the upper nibble
	|	('V4l' 			field_val?)		// 4 bits in the lower nibble
	|	('V' 	pdu_field_size 	field_val?)		// 8bit value-only
	|	('TLV' 	pdu_field_size? field_val? field_tag)	// full TLV
	|	('LV' 	pdu_field_size 	field_val?)		// LV without Tag
	|	('TV'	pdu_field_size 	field_val? field_tag)	// TV with fixed length value
	|	('T'			field_val? field_tag)	// T only
	|	('TV4'			field_val? field_tag)	// T is upper nibble, value lower nibble
	) pdu_field_opts*;
	
pdu_field_def 
	: ID pdu_field_mode pdu_field_type
						-> ^(ID pdu_field_mode pdu_field_type)
	;
	

/* LEXER RULES */

fragment
NEWLINE	:	'\r'? '\n';

ID  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;
    
NUMERIC : INT | HEX ;

COMMENT
    :   '//' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    |   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
    |	'#' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

STRING
    :  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
    ;

COMP_OP	:	'==' | '<' | '>' | '>=' | '<=' | '!=';

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;
fragment
INT :	'0'..'9'+
    ;
    
fragment
HEX 	: '0x' HEX_DIGIT+
	;