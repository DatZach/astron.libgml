/// @func or_register_callback(messageType, callback, args);
/// Registers a callback for *_RESP messages
/// @context pObjectRepository
/// @param messageType real
/// @param callback script
/// @param args array
/// @returns real contextId

assert_ancestor(pObjectRepository);

var messageType = argument0;
var callback = argument1;
var args = argument2;

var respMessageType = or_msg_to_msgresp(messageType);
var context = self.contextCounters[? respMessageType];
self.contextCounters[? respMessageType]++;
self.callbacks[? [respMessageType, context]] = [callback, args];

return context;
