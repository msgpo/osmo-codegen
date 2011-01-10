# TODO: we always code bitfields from LSB to MSB, the parser needs to know that!

ie_spec cell_identity
	cell_identity		16	bit	big
end_ie_spec

# 10.5.1.3 Location Area ID
ie_spec location_area_id
	mcc			3	bcd
	mnc			3	bcd
	lac			16	bit	big
end_ie_spec

# 10.5.1.4 Mobile ID
ie_spec mobile_id
	type			3	bit
	odd_even_ind		1	bit
	identity_digit		*	bcd
end_ie_spec

# 10.5.1.5 MS Classmark 1
ie_spec ms_classmark1
	rf_pwr_capa		3	bit
	a51			1	bit
	es_ind			1	bit
	rev_level		2	bit
	spare			1	bit
end_ie_spec

# 10.5.1.6 MS Classmark 2
ie_spec ms_classmark2
	rf_pwr_capa		3	bit
	a51			1	bit
	es_ind			1	bit
	rev_level		2	bit
	spare			1	bit
	fc			1	bit
	vgcs			1	bit
	vbs			1	bit
	sm_capa			1	bit
	ss_screen_ind		2	bit
	ps_capa			1	bit
	spare2			1	bit
	a52			1	bit
	a53			1	bit
	cmsp			1	bit
	solsa			1	bit
	ucs2			1	bit
	lcsva_capa		1	bit
	spare3			1	bit
	cm3			1	bit
end_ie_spec

# 10.5.1.7 MS Classmark 3: too complex

# 10.5.1.11 Priority level: TV4, no need
