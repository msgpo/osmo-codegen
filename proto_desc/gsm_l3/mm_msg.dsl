# GSM L3 Messages for mobility management 

# up-to-date with 3GPP TS 24.008 version 7.6.0 Release 7

# 9.2.1 Authentication Reject
pdu_spec mm_auth_rej
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	value 0x11
end_pdu_spec

# 9.2.2 Authentication Request
pdu_spec mm_auth_req
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x12
	cksn			mand	V4u
	spare			mand	V4l
	auth_rand		mand	V	16
	auth_autn		opt	TLV	18		tag 0x20
end_pdu_spec

# 9.2.3 Authentication Response
pdu_spec mm_auth_resp
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x14
	auth_sres		mand	V	4
	auth_sres_ext		opt	TLV	3-14		tag 0x21
end_pdu_spec

# 9.2.3a Authentication failure
pdu_spec mm_auth_fail
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x1c
	reject_cause		mand	V	1
	auth_fail_param		opt	TLV	16		tag 0x22
end_pdu_spec

# 9.2.4 CM re-establishment request
pdu_spec cm_reest_req
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x28
	cksn			mand	V4u
	spare			mand	V4l
	classmark2		mand	LV	4				ie ms_classmark2
	mobile_id		mand	LV	2-9				ie mobile_id
	# this IE is conditional on mobile_id being of type TMSI
	location_area_id	cond	TV	6		tag 0x13	ie location_area_id
end_pdu_spec

# 9.2.5 CM service accept
pdu_spec cm_service_acc
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x21
end_pdu_spec

# 9.2.6a CM service prompt CCBS
pdu_spec cm_service_prompt
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x25
	pd_and_sapi		mand	V	1
end_pdu_spec

# 9.2.6 CM service reject
pdu_spec cm_service_rej
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x22
	reject_cause		mand	V	1
end_pdu_spec

# 9.2.7 CM service abort
pdu_spec cm_service_abort
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x23
end_pdu_spec

# 9.2.8 abort
pdu_spec mm_abort
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x29
	reject_cause		mand	V	1
end_pdu_spec

# 9.2.9 CM service request
pdu_spec cm_service_req
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x24
	cm_serv_type		mand	V4u
	cksn			mand	V4l
	classmark2		mand	LV	4				ie ms_classmark2
	mobile_id		mand	LV	2-9				ie mobile_id
	mm_priority		mand	TV4			tag 0x80
end_pdu_spec

# 9.2.10 Identity request
pdu_spec mm_identity_req
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x18
	identity_type		mand	V4u
	spare			mand	V4l
end_pdu_spec

# 9.2.11 Identity response
pdu_spec mm_identity_resp
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x19
	mobile_id		mand	LV	2-10				ie mobile_id
end_pdu_spec

# 9.2.12 IMSI detach indication
pdu_spec mm_imsi_det_ind
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x01
	classmark1		mand	V	1				ie ms_classmark1
	mobile_id		mand	LV	2-9				ie mobile_id
end_pdu_spec

# 9.2.13 Location updating accept
pdu_spec mm_loc_upd_acc
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x02
	location_area_id	mand	V	5				ie location_area_id
	mobile_id		opt	TLV	310		tag 0x17	ie mobile_id
	follow_on_proceed	opt	T			tag 0xa1
	cts_permission		opt	T			tag 0xa2
	equivalent_plmns	opt	TLV	5-47		tag 0x4a
	emerg_numb_list		opt	TLV	5-50		tag 0x34
end_pdu_spec

# 9.2.14 Location updating reject
pdu_spec mm_loc_upd_rej
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x04
	reject_cause		mand	V	1
end_pdu_spec

# 9.2.15 Location updating request
pdu_spec mm_loc_upd_req
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x08
	loc_upd_type		mand	V4u
	cksn			mand	V4l
	location_area_id	mand	V	5				ie location_area_id
	classmark1		mand	V	1				ie ms_classmark1
	mobile_id		mand	LV	2-9				ie mobile_id
	umts_classmark2		opt	TLV	5		tag 0x33
end_pdu_spec

# 9.2.15a MM information
pdu_spec mm_info
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x32
	mm_net_name_full	opt	TLV	3-255		tag 0x43	ie mm_network_name
	mm_net_name_short	opt	TLV	3-255		tag 0x45	ie mm_network_name
	mm_time_zone		opt	TV	2		tag 0x46
	mm_nitz			opt	TV	8		tag 0x47	ie mm_nitz
	lsa_id			opt	TLV	2-5		tag 0x48
	daylight_saving_time	opt	TLV	3		tag 0x49
end_pdu_spec

# 9.2.16 MM status
pdu_spec mm_status
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x31
	reject_cause		mand	V	1
end_pdu_spec

# 9.2.16 TMSI reallocation command
pdu_spec mm_tmsi_reall_cmd
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x1a
	location_are_id		mand	V	5				ie location_area_id
	mobile_id		mand	LV	2-9				ie mobile_id
end_pdu_spec

# 9.2.18 TMSI reallocation complete
pdu_spec mm_tmsi_reall_compl
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x1b
end_pdu_spec

# 9.2.19 MM Null
pdu_spec mm_null
	proto_disc		mand	V4u		val 5
	skip_ind		mand	V4l
	msg_type		mand	V	1	val 0x30
end_pdu_spec
