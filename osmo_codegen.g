grammar osmo_codegen;

//options {
	//language = Python;
//}
root	:	
	pdu_spec*
	;

pdu_spec
	: 'pdu_spec' ID 
		field_def*
	'end_pdu_spec'
	;

field_mode
	:	'mand' | 'opt' | 'cond';

field_val
	:	('val'|'value') NUMERIC;

field_tag
	:	'tag' NUMERIC;

field_size
	:	NUMERIC ('-' NUMERIC)? ;

field_opts
	:	('uplink_only' | 'downlink_only')
	;

field_type
	:	(
		('V4u' 	field_val?)
	|	('V4l' 	field_val?)
	|	('V' 	field_size 	field_val?)
	|	('TLV' 	field_size? 	field_val? field_tag)
	|	('LV' 	field_size 	field_val?)
	|	('TV'	field_size 	field_val? field_tag)
	|	('T'			field_val? field_tag)
	|	('TV4'			field_val? field_tag)
	) field_opts*;
	
field_def 
	: ID field_mode field_type;
	

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