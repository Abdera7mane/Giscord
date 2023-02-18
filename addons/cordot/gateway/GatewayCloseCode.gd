class_name GatewayCloseCode

enum {
	# Gateway
	
	UNKOWN_ERROR              = 4000,
	DECODE_ERROR              = 4002,
	SESSION_NO_LONGER_VALID   = 4006,
	INVALID_SEQ               = 4007,
	RATE_LIMITED              = 4008,
	INVALID_SHARD             = 4010,
	SHARDING_REQUIRED         = 4011,
	INVALID_API_VERSION       = 4012,
	INVALID_INTENTS           = 4013,
	DISALLOWED_INTENTS        = 4014,
	
	# Voice
	
	FAILED_TO_DECODE_PAY_LOAD = 4002,
	SESSION_TIMED_OUT         = 4009,
	SERVER_NOT_FOUND          = 4011,
	UNKOWN_PROTOCOL           = 4012,
	DISCONNECTED              = 4014,
	VOICE_SERVER_CRASHED      = 4015,
	UNKOWN_ENCRYPTION_MODE    = 4016
	
	# Gateway & Voice
	
	UNKOWN_OPCODE             = 4001,
	NOT_AUTHENTICATED         = 4003,
	AUTHENTICATION_FAILED     = 4004,
	ALREADY_AUTHENTICATED     = 4005,
}
