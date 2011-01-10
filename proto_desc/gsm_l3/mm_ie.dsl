
# 10.5.3.1 Auth parameter RAND: no need
# 10.5.3.1.1 Auth parameter AUTN: no need
# 10.5.3.2 Auth response parameter: no need
# 10.5.3.2.1 Auth resp extension: no need
# 10.5.3.2.2 Auth failure parameter: no need 
# 10.5.3.3 CM service type: no need (TV4)
# 10.5.3.4 Identity type: no need (TV4)
# 10.5.3.5 Location updating type: no need (TV4)

# 10.5.3.5a Network Name
ie_spec mm_network_name
	num_spare_bits		3	bit
	add_ci			1	bit
	coding_scheme		3	bit
	ext			1	bit
	text			*	byte
end_ie_spec

# 10.5.3.6 Reject cause: no need, single byte
# 10.5.3.7 Follow on proceed: no need (single byte)
# 10.5.3.8 Time Zone: no need (single byte)
# 10.6.3.9 Time Zone and Time
ie_spec mm_nitz
	year			2	bcd
	month			2	bcd
	day			2	bcd
	hour			2	bcd
	minute			2	bcd
	second			2	bcd
	time_zone		2	bcd
end_ie_spec

# 10.6.3.10 CTS permission: no need (single byte)

# 10.5.3.11 LSA identifier: no need

# 10.5.3.13 Emergency Number list (too complex)
