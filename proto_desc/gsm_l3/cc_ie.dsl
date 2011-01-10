
# 10.5.4.4 Auxiliary states
ie_spec cc_auxiliary_states
	mpty_aux_state		2	bits
	hold_aux_state		2	bits
	spare			3	bits	val 0
	ext			1	bit	val 1
end_ie_spec

# 10.5.4.4a backup bearer capability: too complex
# 10.5.4.5 bearer capability: too complex

# 10.5.4.5a CC capabilities
ie_spec cc_capabilities
	dtmf			1	bit
	pcp			1	bit
	enicm			1	bit
	spare			1	bit	val 0
	max_supp_bearers	4	bit
	max_speech_bearers	4	bit
	spare2			4	bit	val 0
end_ie_spec

# 10.5.4.6 Call state
ie_spec cc_call_state
	call_state		6	bit
	coding_standard		2	bit
end_ie_spec

# 10.5.4.7 Called party BCD number
ie_spec cc_called_party_bcd_number
	content_len		1	byte
	numbering_plan_id	4	bit
	type_of_number		3	bit
	ext			1	bit	val 1
	digits			*	bcd
end_ie_spec

# 10.5.4.8 Called party subaddress
ie_spec cc_called_party_subaddr
	content_len		1	byte
	spare			3	bit	val 0
	odd_even_ind		1	bit
	type_of_subaddr		3	bit
	ext			1	bit	val 1
	subaddr_info		*	byte
end_ie_spec

# 10.5.4.9 Calling party BCD number
ie_spec cc_calling_party_bcd_number
	content_len		1	byte
	numbering_plan_id	4	bit
	type_of_number		3	bit
	ext1			1	bit
	screening_ind		2	bit		if (ext1 == 0)
	spare			3	bit	val 0	if (ext1 == 0)
	presentation_ind	2	bit		if (ext1 == 0)
	ext2			1	bit	val 1	if (ext1 == 0)
	digits			*	bcd
end_ie_spec

# 10.5.4.10 Calling party subaddress
ie_alias cc_calling_party_subaddr cc_called_party_subaddr

# 10.5.4.11 Cause
ie_spec cc_cause
	location		4	bit
	spare			1	bit	val 0
	coding_standard		2	bit
	ext1			1	bit
	recommendation		7	bit		if (ext1 == 0)
	ext2			1	bit	val 1	if (ext1 == 0)
	cause			7	bit
	ext3			1	bit	val 1
	diagnostics		*	byte
end_ie_spec

# 10.5.4.11a CLIR suppression: no need
# 10.5.4.11b CLIR invocation: no need
# 10.5.4.12 Congestion level: no need

# 10.5.4.13 Connected number
ie_alias cc_connected_party_bcd_number cc_calling_party_bcd_number

# 10.5.4.14 Connected subaddress
ie_alias cc_connected_party_subaddr cc_called_party_subaddr

# 10.5.4.15 Facility: no need

# 10.5.4.16 Higher layer compatibility
ie_spec cc_high_layer_compat
	pres_method		2	bit
	interpretation		3	bit
	ext1			1	bit	val 1
	hl_charact_id		7	bit
	ext2			1	bit
	ext_hl_charact_id	7	bit		if (ext1 == 0)
	ext3			1	bit	val 1
end_ie_spec

# 10.5.4.17 Keypad facility: no need
# 10.5.4.18 Low layer compatibility: no need
# 10.5.4.19 More data: no need
# 10.5.4.20 Notification ind: no need

# 10.5.4.21 Progress ind
ie_spec cc_progress_ind
	location		3	bit
	spare			1	bit	val 0
	coding_standard		2	bit
	ext1			1	bit	val 1
	progress_descr		7	bit
	ext2			1	bit	val 1
end_ie_spec

# 10.5.4.21b Redirecting party BCD number
ie_alias cc_redir_party_bcd_number	cc_calling_party_bcd_number

# 10.5.4.21c Redirecting party subaddr
ie_alias cc_redir_party_subaddr		cc_calling_party_subaddr

# 10.5.4.22 Repeat indicator: no need (TV4)
# 10.5.4.22a Reverse call setup direction: no need
# 10.5.4.22b SETUP container: no need
# 10.5.4.23 Signal: no need
# 10.5.4.24 SS Version ind: no need
# 10.5.4.25 User-user
ie_spec cc_user_user
	pdisc			1	byte
	info			*	byte
end_ie_spec

# 10.5.4.26 Alerting Pattern: no need

# 10.5.4.27 Allowed actions: no need

# 10.5.4.28 Stream identifier: no need
# 10.5.4.29 Network call control capabilities: no need
# 10.5.4.30 Cause of no CLI: no need
# 10.5.4.31 Void
# 10.5.4.32 Supported codec list: too complex
# 10.5.4.33 Service category: no need
# 10.5.4.34 Redial: no need
# 10.5.4.35: Network-initiated service upgrade indicator: no need
