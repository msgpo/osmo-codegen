# GSM L3 Messages for mobility management 

# up-to-date with 3GPP TS 24.008 version 7.6.0 Release 7

# 9.3.1 Alerting
pdu_spec cc_alerting
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x01
	facility		opt	TLV	2-255		tag 0x1c
	progress_ind		opt	TLV	4		tag 0x1e	ie cc_progress_ind
	user_user		opt	TLV	3-131		tag 0x7e	ie cc_user_user
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
end_pdu_spec

# 9.3.2 Call Confirmed
pdu_spec cc_call_confirmed
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x08
	repeat_ind		cond	TV4			tag 0xd0
	bearer_capability1	opt	TLV	3-16		tag 0x04
	bearer_capability2	opt	TLV	3-16		tag 0x04
	cause			opt	TLV	4-32		tag 0x08	ie cc_cause
	cc_capabilities		opt	TLV	4		tag 0x15	ie cc_capabilities
	stream_id		opt	TLV	3		tag 0x2d
	supported_codecs	opt	TLV	5-255		tag 0x40
end_pdu_spec

# 9.3.3 Call proceeding
pdu_spec cc_call_proceeding
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x02
	repeat_ind		cond	TV4			tag 0xd0
	bearer_capability1	opt	TLV	3-16		tag 0x04
	bearer_capability2	opt	TLV	3-16		tag 0x04
	facility		opt	TLV	2-255		tag 0x1c
	progress_ind		opt	TLV	4		tag 0x1e	ie cc_progress_ind
	priority_granted	opt	TV4			tag 0x80
	net_cc_capabilities	opt	TLV	3		tag 0x2f
end_pdu_spec

# 9.3.4 Congestion control
pdu_spec cc_congestion_ctrl
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x39
	congestion_level	mand	V4u
	spare			mand	V4l
	cause			opt	TLV	4-32		tag 0x08	ie cc_cause
end_pdu_spec

# 9.3.5 Connect
pdu_spec cc_connect
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x07
	facility		opt	TLV	2-255		tag 0x1c
	progress_ind		opt	TLV	4		tag 0x1e			ie cc_progress_ind
	connected_nr		opt	TLV	3-14		tag 0x4c	downlink_only	ie cc_connected_party_bcd_number
	connected_subaddr	opt	TLV	2-23		tag 0x4d			ie cc_connected_party_subaddr
	user_user		opt	TLV	3-131		tag 0x7e			ie cc_user_user
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
	stream_id		opt	TLV	3		tag 0x2d	uplink_only
end_pdu_spec

# 9.3.6 Connect acknowledge
pdu_spec cc_connect_ack
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x0f
end_pdu_spec

# 9.3.7 Disconnect
pdu_spec cc_disconnect
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x25
	cause			mand	LV	3-31						ie cc_cause
	facility		opt	TLV	2-255		tag 0x1c
	progress_ind		opt	TLV	4		tag 0x1e	downlink_only	ie progress_ind
	user_user		opt	TLV	3-131		tag 0x7e			ie user_user
	allowed_actions		opt	TLV	3		tag 0x7b	downlink_only
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
end_pdu_spec

# 9.3.8 Emergency Setup
pdu_spec cc_emergency_setup
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x0e
	bearer_capability	opt	TLV	3-11		tag 0x04
	stream_id		opt	TLV	3		tag 0x2d
	supported_codecs	opt	TLV	5-255		tag 0x40
	emergency_category	opt	TLV	3		tag 0x2e
end_pdu_spec

# 9.3.9 Facility
pdu_spec cc_facility
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x3a
	facility		mand	LV	1-255
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
end_pdu_spec

# 9.3.10 Hold
pdu_spec cc_hold
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x18
end_pdu_spec

# 9.3.11 Hold Acknowledge
pdu_spec cc_hold_ack
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x19
end_pdu_spec

# 9.3.12 Hold Reject
pdu_spec cc_hold_rej
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x1a
	cause			mand	LV	3-31				ie cc_cause
end_pdu_spec

# 9.3.13 Modify
pdu_spec cc_modify
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x17
	bearer_capability	mand	LV	2-15
	low_layer_comp		opt	TLV	2-18		tag 0x7c	ie cc_low_layer_compat
	high_layer_comp		opt	TLV	2-5		tag 0x7d	ie cc_high_layer_compat
	rev_call_setup_dir	opt	T			tag 0xa3
	net_in_serv_up_ind	opt	T			tag 0xa4
end_pdu_spec

# 9.3.14 Modify complete
pdu_spec cc_modify_compl
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x1f
	low_layer_comp		opt	TLV	2-18		tag 0x7c	ie cc_low_layer_compat
	high_layer_comp		opt	TLV	2-5		tag 0x7d	ie cc_high_layer_compat
	rev_call_setup_dir	opt	T			tag 0xa3
end_pdu_spec

# 9.3.14 Modify reject
pdu_spec cc_modify_rej
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x13
	bearer_capability	mand	LV	2-15
	cause			mand	LV	3-31				ie cc_cause
	low_layer_comp		opt	TLV	2-18		tag 0x7c	ie cc_low_layer_compat
	high_layer_comp		opt	TLV	2-5		tag 0x7d	ie cc_high_layer_compat
end_pdu_spec

# 9.3.16 Notify
pdu_spec cc_notify
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x3e
	notification_ind	mand	V	1
end_pdu_spec

# 9.3.17 Progress
pdu_spec cc_progress
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x03
	progress_ind		mand	LV	3				ie cc_progress_ind
	user_user		opt	TLV	3-131		tag 0x7e	ie cc_user_user
end_pdu_spec

# 9.3.17a CC-Establishment
pdu_spec cc_establishment
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x04
	setup_container		mand	LV	3-255
end_pdu_spec

# 9.3.17b CC-Establishment confirmed
pdu_spec cc_establishment_conf
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x05
	repeat_ind		cond	TV4			tag 0xd0
	bearer_capability1	mand	TLV	3-10		tag 0x04
	bearer_capability2	opt	TLV	3-10		tag 0x04
	cause			opt	TLV	4-32		tag 0x08	ie cc_cause
	supported_codecs	opt	TLV	5-255		tag 0x40
end_pdu_spec

# 9.3.18 Release
pdu_spec cc_release
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x2d
	cause			opt	TLV	4-32		tag 0x08	ie cc_cause
	second_cause		opt	TLV	4-32		tag 0x08	ie cc_cause
	facility		opt	TLV	2-255		tag 0x1c
	user_user		opt	TLV	3-131		tag 0x7e	ie cc_user_user
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
end_pdu_spec

# 9.3.18a Recall
pdu_spec cc_recall
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x0b
	recall_type		mand	V	1
	facility		mand	LV	2-255
end_pdu_spec

# 9.3.19 Release complete
pdu_spec cc_release_compl
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x2a
	cause			opt	TLV	4-32		tag 0x08
	facility		opt	TLV	2-255		tag 0x1c
	user_user		opt	TLV	3-131		tag 0x7e	ie cc_user_user
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
end_pdu_spec

# 9.3.20 Retrieve
pdu_spec cc_retrieve
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x1c
end_pdu_spec

# 9.3.21 Retrieve ACK
pdu_spec cc_retrieve_ack
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x1d
end_pdu_spec

# 9.3.22 Retrieve reject
pdu_spec cc_retrieve_rej
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x1e
	cause			mand	LV	3-31				ie cc_cause
end_pdu_spec

# 9.3.23 Setup
pdu_spec cc_setup
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x05
	bc_repeat_ind		cond	TV4			tag 0xd0
	bearer_capability1	opt	TLV	3-16		tag 0x04
	bearer_capability2	opt	TLV	3-16		tag 0x04
	facility		opt	TLV	2-255		tag 0x1c
	progress_ind		opt	TLV	4		tag 0x1e	downlink_only	ie cc_progress_ind
	signal			opt	TV	2		tag 0x34	downlink_only
	calling_party_bcd	opt	TLV	2-14		tag 0x5c	downlink_only	ie cc_calling_party_bcd_number
	calling_party_subaddr	opt	TLV	2-23		tag 0x5d			ie cc_calling_party_subaddr
	called_party_bcd	opt	TLV	3-19		tag 0x5e			ie cc_called_party_bcd_number
	called_party_subaddr	opt	TLV	2-23		tag 0x6d			ie cc_called_party_subaddr
	redir_party_bcd		opt	TLV	3-19		tag 0x74	downlink_only	ie cc_redir_party_bcd_number
	redir_party_subaddr	opt	TLV	2-23		tag 0x75	downlink_only	ie cc_redir_party_subaddr
	llc_repeat_ind		cond	TV4			tag 0xd0
	low_layer_compat1	opt	TLV	2-18		tag 0x7c			ie cc_low_layer_compat
	low_layer_compat2	opt	TLV	2-18		tag 0x7c			ie cc_low_layer_compat
	hlc_repeat_ind		cond	TV4			tag 0xd0
	high_layer_compat1	opt	TLV	2-5		tag 0x7d			ie cc_high_layer_compat
	high_layer_compat2	opt	TLV	2-5		tag 0x7d			ie cc_high_layer_compat
	user_user		opt	TLV	3-35		tag 0x7e			ie cc_user_user
	ss_version		opt	TLV	2-3		tag 0x7f	uplink_only
	clir_suppression	cond	T			tag 0xa1	uplink_only
	clir_invocation		cond	T			tag 0xa2	uplink_only
	cc_capa			opt	TLV	4		tag 0x15	uplink_only
	facility_adv_recall	opt	TLV	2-255		tag 0x1d	uplink_only
	facility_rec_not_ess	opt	TLV	2-255		tag 0x1b	uplink_only
	stream_id		opt	TLV	3		tag 0x2d	uplink_only
	supported_codecs	opt	TLV	5-255		tag 0x40	uplink_only
	redial			opt	T			tag 0xa3	uplink_only
	priority		opt	TV4			tag 0x80	downlink_only
	alert			opt	TLV	3		tag 0x19	downlink_only
	net_cc_capa		opt	TLV	3		tag 0x2f	downlink_only
	cause_of_no_cli		opt	TLV	3		tag 0x3a	downlink_only
	backup_bearer_capa	opt	TLV	3-15		tag 0x41	downlink_only
end_pdu_spec

# 9.3.23a Start CC
pdu_spec cc_start_cc
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x09
	cc_capa			opt	TLV	4		tag 0x15			ie cc_capabilities
end_pdu_spec

# 9.3.24 Start DTMF
pdu_spec cc_start_dtmf
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x35
	keypad_facility		mand	TV	2		tag 0x2c
end_pdu_spec

# 9.3.25 Start DTMF Acknowledge
pdu_spec cc_start_dtmf_ack
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x36
	keypad_facility		mand	TV	2		tag 0x2c
end_pdu_spec

# 9.3.26 Start DTMF Reject
pdu_spec cc_start_dtmf_ack
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x37
	cause			mand	LV	3-31				ie cc_cause
end_pdu_spec

# 9.3.27 Status
pdu_spec cc_status
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x3d
	cause			mand	LV	3-31				ie cc_cause
	call_state		mand	V	1				ie cc_call_state
	auxiliary_states	opt	TLV	3		tag 0x24	ie cc_auxiliary_state
end_pdu_spec

# 9.3.28 Status enquiry
pdu_spec cc_status_enquiry
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x34
end_pdu_spec

# 9.3.29 Stop DTMF
pdu_spec cc_stop_dtmf
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x31
end_pdu_spec

# 9.3.30 Stop DTMF ACK
pdu_spec cc_stop_dtmf_ack
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x32
end_pdu_spec

# 9.3.31 User information
pdu_spec cc_user_info
	proto_disc		mand	V4u		val 3
	trans_id		mand	V4l
	msg_type		mand	V	1	val 0x10
	user_user		mand	LV	2-130				ie cc_user_user
	more_data		opt	T			tag 0xa0
end_pdu_spec
