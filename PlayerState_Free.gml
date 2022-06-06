function PlayerState_Free()
{
	get_inputs();
	
	
	if (keyRight)
	{
		hSpeed = walkSpeed;
		plyrDir = "right";
		sprite_index = spr_walk_right;
	}
	else if (keyLeft)
	{
		hSpeed = -walkSpeed;
		plyrDir = "left";
		sprite_index = spr_walk_left;
	}
	else
	{
		scr_hfriction(gFriction);
		sprite_index = spr_jump;
	}
	
	vSpeed += gravSpeed;

	if (place_meeting(x+hSpeed,y,obj_tile))
	{
		var onePixel = sign(hSpeed);
		while (!place_meeting(x+onePixel,y,obj_tile)) x += onePixel;
		hSpeed = 0;
	}
	x += hSpeed;

	if (place_meeting(x,y+vSpeed,obj_tile))
	{
		var onePixel = sign(vSpeed);
		while (!place_meeting(x,y+onePixel,obj_tile)) y += onePixel;
		vSpeed = 0;
	}
	y += vSpeed;

	
	if (vSpeed > 0)
	{
		state = PLAYERSTATE.JUMPING;
	}
	
	else if (isGrounded && keyJump)
	{
		vSpeed -= jumpHeight;
		state = PLAYERSTATE.JUMPING;
	}
	
	else if (keyPunch) state = PLAYERSTATE.ATTACK_PUNCH;
}
