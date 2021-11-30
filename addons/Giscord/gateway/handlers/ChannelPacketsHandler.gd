class_name ChannelPacketsHandler extends PacketHandler

const PACKETS: Dictionary = {
	"CHANNEL_CREATE": "_on_channel_create",
	"CHANNEL_UPDATE": "_on_channel_update",
	"CHANNEL_DELETE": "_on_channel_delete",
	"CHANNEL_PINS_UPDATE": "_on_channel_pins_update",
	"STAGE_INSTANCE_CREATE": "_on_stage_instance_create",
	"STAGE_INSTANCE_UPDATE": "_on_stage_instance_update",
	"STAGE_INSTANCE_DELETE": "on_stage_instance_delete"
}

var _entity_manager: BaseDiscordEntityManager

func _init(manager: BaseDiscordEntityManager) -> void:
	_entity_manager = manager

func get_packets() -> Dictionary:
	return PACKETS

func _on_channel_create(fields: Dictionary) -> void:
	var channel: Channel = _entity_manager.get_or_construct_channel(fields)
	if channel.has_method("get_guild"):
		channel.guild._add_channel(channel.id)
		self.emit_signal("transmit_event", "channel_created", [channel])

func _on_channel_update(fields: Dictionary) -> void:
	var id: int = fields["id"] as int
	var channel: Channel = _entity_manager.get_channel(id)
	if channel:
		var old: Channel = channel.clone()
		_entity_manager.channel_manager.update_channel(channel, fields)
		self.emit_signal("transmit_event", "channel_updated", [old, channel])

func _on_channel_delete(fields: Dictionary) -> void:
	var channel: Channel = _entity_manager.get_or_construct_channel(fields)
	if channel:
		if channel.has_method("get_guild"):
			channel.guild._remove_channel(channel.id)
		_entity_manager.remove_channel(channel.id)
		self.emit_signal("transmit_event", "channel_deleted", [channel])

# warning-ignore:unused_argument
func _on_channel_pins_update(fields: Dictionary) -> void:
	pass

func get_class() -> String:
	return "ChannelPacketsHandler"