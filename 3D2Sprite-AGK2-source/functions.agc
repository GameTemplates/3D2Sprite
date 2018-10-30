// rotate sprite toward mouse
function RotateToPosition(sID,posX,posY, angleoffset)
	angle = AtanFull(GetSpriteX(sID) - posX, GetSpriteY(sID) - posY )
	SetSpriteAngle(sID,angle - angleoffset )	
endfunction


// check if pointer is over any sprite and pressed
function SpritePressed(sID,state)
	pressed = 0
	if GetPointerReleased()
		pressed = 0
	endif
	
	if MouseIsOnSprite(sID)
		if state = 0
			if GetPointerReleased()
				pressed = 1
			endif
		else
			if GetPointerState()
				pressed = 1
			endif
		endif
	endif
endfunction pressed


//save screen to image
function SaveScreenToImage(imageID,imageName$,posX,posY,sWidth,sHeight)
	Swap()
	Render()
	GetImage(imageID,posX,posY,sWidth,sHeight)
	//Save Image File
	SaveImage(imageID,imageName$)
endfunction

//make parent two objects
function MakeParent(pID,cID)
	DistanceX = GetSpriteWidth(pID) * GetSpriteX(cID) - GetsPriteWidth(cID) / 2
	DistanceY = GetSpriteHeight(pID) * GetSpriteY(cID) - GetsPriteHeight(cID) / 2
	childX = ((cos(GetSpriteAngleRad(pID)) * 100) - (sin(GetSpriteAngleRad(pID)) * 100) + GetSpriteX(pID))
	childY = ((sin(GetSpriteAngleRad(pID)) * 100) + (cos(GetSpriteAngleRad(pID)) * 100) + GetSpriteY(pID))
	SetSpritePosition(cID, childX, childY)
endfunction


//move sprite to position
function MoveSpriteToPosition(sID,posX,posY,speed)
	newX = posX - GetSpriteX(sID)
	newY = posY - GetSpriteY(sID)
	SetSpritePosition(sID,newX,newY) 
endfunction

// draggable sprite
function DragSprite(sID)
	global drag as integer
	
//make sure sprites are inactive when not dragged
	if GetSpriteActive(sID) = 1 and GetPointerState() = 0
		if MouseIsOnSprite(sID) = 0
			SetSpriteActive(sID,0)
		endif
		
		if MouseIsOnSprite(sID) = 1
			SetSpriteActive(sID,0)
		endif
	endif
	
//drag sprites using the pointer
	if GetPointerReleased()
		drag = 0
	endif
	
	if SpritePressed(sID,0)
		drag = 1
	endif
	
	//activate sprite to be dragged
	if MouseIsOnSprite(sID) and GetPointerState() and drag = 1 
		SetSpriteActive(sID,1)
		drag = 0
	endif
	
	//drag active sprite
	if GetSpriteActive(sID) = 1 
		SetSpritePositionByOffset(sID,GetPointerX(),GetPointerY())
	endif
endfunction

//chekc if pointer is on sprite
function MouseIsOnSprite(sID)
		if GetPointerX() > GetSpriteXByOffset(sID) - (GetSpriteWidth(sID) / 2)
			if GetPointerX() < GetSpriteXByOffset(sID) + (GetSpriteHeight(sID) / 2)
				if GetPointerY() > GetSpriteYByOffset(sID) - (GetSpriteHeight(sID) / 2)
					if GetPointerY() < GetSpriteYByOffset(sID) + (GetSpriteHeight(sID) / 2)
						mouseonsprite = 1
					endif
				endif
			endif
		else 
			mouseonsprite = 0
		endif
endfunction mouseonsprite

//get sprite ID
function GetSpriteID(positionX,positionY)
		spriteID = GetSpriteHit(positionX,positionY)
endfunction spriteID
