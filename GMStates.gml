#macro STATE_ENTER  "state_enter"
#macro STATE_UPDATE "state_update"
#macro STATE_LEAVE  "state_leave"
/**
 * A state machine constructor.
 * Create, set cycles, change, and update states, using the dot notation.
 */
function GMStates() constructor {
	
	state = {
		NULLSTATE : {
			STATE_ENTER  : function() {},	
			STATE_UPDATE : function() {},	
			STATE_LEAVE  : function() {}
		}
	};
	
	state_active = "NULLSTATE";
	
	/**
	 * Create a state handle.
	 * @param {string} _state State handle.
	 */
	create = function(_state) {
		if struct_exists(state, _state) { exit; }
		state[$ _state] = {
			STATE_ENTER  : function() {},	
			STATE_UPDATE : function() {},	
			STATE_LEAVE  : function() {}
		}
	}
	
	/**
	 * Set the callback function for the various cycles in a state.
	 * @param {string} _state State handle.
	 * @param {string} _cycle State cycles: STATE_ENTER, STATE_UPDATE, and STATE_LEAVE.
	 * @param {function} _callback Callback function.
	 */
	set = function(_state, _cycle, _callback) {
		state[$ _state][$ _cycle] = _callback;
	}
	
	/**
	 * Change to another state by their handle name.
	 * @param {string} _state State handle.
	 */
	change = function(_state) {
		if !struct_exists(state, _state) { exit; }
		state[$ state_active].state_leave();	
		state_active = _state;
		state[$ _state].state_enter();
	}
	
	/**
	 * Calls the update cycle every frame.
	 */
	update = function() {
		if is_undefined(state_active) { exit; }
		state[$ state_active].state_update();
	}
	
}
