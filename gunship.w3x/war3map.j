globals
//globals from MathUtils:
constant boolean LIBRARY_MathUtils=true
//endglobals from MathUtils
//globals from Stack:
constant boolean LIBRARY_Stack=true
//endglobals from Stack
//globals from StringUtils:
constant boolean LIBRARY_StringUtils=true
//endglobals from StringUtils
//globals from TimerUtils:
constant boolean LIBRARY_TimerUtils=true
        //How to tweak timer utils:
        // USE_HASH_TABLE = true  (new blue)
        //  * SAFEST
        //  * SLOWEST (though hash tables are kind of fast)
        //
        // USE_HASH_TABLE = false, USE_FLEXIBLE_OFFSET = true  (orange)
        //  * kinda safe (except there is a limit in the number of timers)
        //  * ALMOST FAST
        //
        // USE_HASH_TABLE = false, USE_FLEXIBLE_OFFSET = false (red)
        //  * THE FASTEST (though is only  faster than the previous method
        //                  after using the optimizer on the map)
        //  * THE LEAST SAFE ( you may have to tweak OFSSET manually for it to
        //                     work)
        //
constant boolean TimerUtils___USE_HASH_TABLE= false
constant boolean TimerUtils___USE_FLEXIBLE_OFFSET= false

constant integer TimerUtils___OFFSET= 0x100000
integer TimerUtils___VOFFSET= TimerUtils___OFFSET
              
        //Timers to preload at map init:
constant integer TimerUtils___QUANTITY= 256
        
        //Changing this  to something big will allow you to keep recycling
        // timers even when there are already AN INCREDIBLE AMOUNT of timers in
        // the stack. But it will make things far slower so that's probably a bad idea...
constant integer TimerUtils___ARRAY_SIZE= 8190

// processed:         integer array TimerUtils___data[TimerUtils___ARRAY_SIZE]
hashtable TimerUtils___ht
// processed:         timer array TimerUtils___tT[TimerUtils___ARRAY_SIZE]
integer TimerUtils___tN= 0
constant integer TimerUtils___HELD=0x28829022
        //use a totally random number here, the more improbable someone uses it, the better.
//endglobals from TimerUtils
//globals from CameraPosSync:
constant boolean LIBRARY_CameraPosSync=true
constant real CameraPosSync_SYNC_INTERVAL= 0.5
constant string CameraPosSync_PREFIX= "CameraPosSync"

real array cameraEyeX
real array cameraEyeY
real array cameraEyeZ
real array cameraTargetX
real array cameraTargetY
real array cameraTargetZ
real array cameraDistance
    
trigger CameraPosSync___syncTrigger= CreateTrigger()
//endglobals from CameraPosSync
//globals from SoundUtils:
constant boolean LIBRARY_SoundUtils=true
hashtable SoundUtils___ht= InitHashtable()
hashtable SoundUtils___st= InitHashtable()
hashtable SoundUtils___rt= InitHashtable()
hashtable SoundUtils___kt= InitHashtable()
//endglobals from SoundUtils
//globals from Gunship:
constant boolean LIBRARY_Gunship=true
hashtable Gunship___h= InitHashtable()
timer array Gunship___rotationTimer
trigger Gunship___zoomInTrigger= CreateTrigger()
trigger Gunship___zoomOutTrigger= CreateTrigger()
trigger Gunship___speedUpTrigger= CreateTrigger()
trigger Gunship___speedDownTrigger= CreateTrigger()
trigger Gunship___nightVisionTrigger= CreateTrigger()
//endglobals from Gunship
    // User-defined
unit array udg_Gunship
boolean array udg_GunshipFires
boolean array udg_ShowUI
boolean array udg_GunshipDontMove
integer array udg_GunshipWeapon
integer array udg_GunshipWeaponTypes
integer udg_GunshipWeaponTypesMax= 0
boolean array udg_LeftMouseDown
boolean array udg_RightMouseDown
unit array udg_GunshipTarget
location array udg_CameraSource
location array udg_CameraTarget
force udg_AirForce= null
force udg_GroundForce= null
timer udg_VictoryTimer= null
timer array udg_GunshipFireTimer
dialog array udg_QuitDialog
button array udg_QuitDialogButtonYes
boolean array udg_GunshipNightVision
multiboard udg_Multiboard= null
string udg_TmpString
unit udg_Marker= null
real array udg_GunshipSpeed
integer udg_MultiboardRow= 0

    // Generated
trigger gg_trg_Initialization= null
trigger gg_trg_Start= null
trigger gg_trg_Update_Gunships= null
trigger gg_trg_Update_Multiboards= null
trigger gg_trg_Fire_End= null
trigger gg_trg_Fire_Mouse_Down= null
trigger gg_trg_Fire_Mouse_Up= null
trigger gg_trg_Change_Weapon= null
trigger gg_trg_Mouse_Down= null
trigger gg_trg_Mouse_Up= null
trigger gg_trg_Restore= null
trigger gg_trg_Escape_UI= null
trigger gg_trg_Escape_Quit= null
trigger gg_trg_Escape_Quit_Yes= null
trigger gg_trg_Change_Target= null
trigger gg_trg_Victory_Air_Force= null
trigger gg_trg_Victory_Ground_Force_Time= null
unit gg_unit_H000_0004= null
unit gg_unit_n000_0003= null
unit gg_unit_n001_0096= null
unit gg_unit_H000_0097= null
unit gg_unit_n001_0098= null
unit gg_unit_H003_0111= null
unit gg_unit_H003_0112= null
trigger gg_trg_Victory_Ground_Force_Kill= null
integer SOUND_MACHINEGUN

trigger l__library_init

//JASSHelper struct globals:
constant integer si__Stack=1
integer si__Stack_F=0
integer si__Stack_I=0
integer array si__Stack_V
constant integer s__Stack_EMPTY=0x28829022
integer array s__Stack_size
integer array s__Stack_top
integer s__Stack_free= 1
integer array s__Stack_next
integer array s__Stack_value
constant integer si__SoundUtils___soundhelper=2
integer si__SoundUtils___soundhelper_F=0
integer si__SoundUtils___soundhelper_I=0
integer array si__SoundUtils___soundhelper_V
integer array s__SoundUtils___soundhelper_sta
string array s__SoundUtils___soundhelper_fileName
integer array s__SoundUtils___soundhelper_duration
boolean array s__SoundUtils___soundhelper_looping
boolean array s__SoundUtils___soundhelper_is3D
boolean array s__SoundUtils___soundhelper_stopwhenoutofrange
integer array s__SoundUtils___soundhelper_fadeInRate
integer array s__SoundUtils___soundhelper_fadeOutRate
string array s__SoundUtils___soundhelper_eaxSetting
constant integer si__SoundUtils___soundrecycler=3
integer si__SoundUtils___soundrecycler_F=0
integer si__SoundUtils___soundrecycler_I=0
integer array si__SoundUtils___soundrecycler_V
timer array s__SoundUtils___soundrecycler_t
sound array s__SoundUtils___soundrecycler_s
integer array s__SoundUtils___soundrecycler_sh
boolean array s__SoundUtils___soundrecycler_stopped
integer array s__TimerUtils___data
timer array s__TimerUtils___tT
trigger st__Stack_onDestroy
trigger st__SoundUtils___soundrecycler_onDestroy
trigger array st___prototype11
trigger array st___prototype32
integer f__arg_integer1
sound f__arg_sound1
boolean f__arg_boolean1
boolean f__arg_boolean2
integer f__arg_this

endglobals


//Generated method caller for Stack.onDestroy
function sc__Stack_onDestroy takes integer this returns nothing
            local integer n
            // Remove all remaining indexes from the stack.
            loop
                // Get the top index.
                set n=s__Stack_top[this]
                exitwhen n == 0
                // Remove it from the stack.
                set s__Stack_top[this]=s__Stack_next[n]
                // Add it to the list of free indexes.
                set s__Stack_next[n]=s__Stack_free
                set s__Stack_free=n
            endloop
endfunction

//Generated allocator of Stack
function s__Stack__allocate takes nothing returns integer
 local integer this=si__Stack_F
    if (this!=0) then
        set si__Stack_F=si__Stack_V[this]
    else
        set si__Stack_I=si__Stack_I+1
        set this=si__Stack_I
    endif
    if (this>8190) then
        return 0
    endif

   set s__Stack_size[this]= 0
   set s__Stack_top[this]= 0
    set si__Stack_V[this]=-1
 return this
endfunction

//Generated destructor of Stack
function sc__Stack_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Stack_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Stack_onDestroy)
    set si__Stack_V[this]=si__Stack_F
    set si__Stack_F=this
endfunction

//Generated method caller for SoundUtils___soundrecycler.onDestroy
function sc__SoundUtils___soundrecycler_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__SoundUtils___soundrecycler_onDestroy)
endfunction

//Generated allocator of SoundUtils___soundrecycler
function s__SoundUtils___soundrecycler__allocate takes nothing returns integer
 local integer this=si__SoundUtils___soundrecycler_F
    if (this!=0) then
        set si__SoundUtils___soundrecycler_F=si__SoundUtils___soundrecycler_V[this]
    else
        set si__SoundUtils___soundrecycler_I=si__SoundUtils___soundrecycler_I+1
        set this=si__SoundUtils___soundrecycler_I
    endif
    if (this>8190) then
        return 0
    endif

   set s__SoundUtils___soundrecycler_t[this]= null
   set s__SoundUtils___soundrecycler_s[this]= null
   set s__SoundUtils___soundrecycler_sh[this]= 0
   set s__SoundUtils___soundrecycler_stopped[this]= false
    set si__SoundUtils___soundrecycler_V[this]=-1
 return this
endfunction

//Generated destructor of SoundUtils___soundrecycler
function sc__SoundUtils___soundrecycler_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__SoundUtils___soundrecycler_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__SoundUtils___soundrecycler_onDestroy)
    set si__SoundUtils___soundrecycler_V[this]=si__SoundUtils___soundrecycler_F
    set si__SoundUtils___soundrecycler_F=this
endfunction

//Generated allocator of SoundUtils___soundhelper
function s__SoundUtils___soundhelper__allocate takes nothing returns integer
 local integer this=si__SoundUtils___soundhelper_F
    if (this!=0) then
        set si__SoundUtils___soundhelper_F=si__SoundUtils___soundhelper_V[this]
    else
        set si__SoundUtils___soundhelper_I=si__SoundUtils___soundhelper_I+1
        set this=si__SoundUtils___soundhelper_I
    endif
    if (this>8190) then
        return 0
    endif

   set s__SoundUtils___soundhelper_fileName[this]= ""
   set s__SoundUtils___soundhelper_duration[this]= 0
   set s__SoundUtils___soundhelper_looping[this]= false
   set s__SoundUtils___soundhelper_is3D[this]= false
   set s__SoundUtils___soundhelper_stopwhenoutofrange[this]= false
   set s__SoundUtils___soundhelper_fadeInRate[this]= 0
   set s__SoundUtils___soundhelper_fadeOutRate[this]= 0
   set s__SoundUtils___soundhelper_eaxSetting[this]= ""
    set si__SoundUtils___soundhelper_V[this]=-1
 return this
endfunction

//Generated destructor of SoundUtils___soundhelper
function s__SoundUtils___soundhelper_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__SoundUtils___soundhelper_V[this]!=-1) then
        return
    endif
    set si__SoundUtils___soundhelper_V[this]=si__SoundUtils___soundhelper_F
    set si__SoundUtils___soundhelper_F=this
endfunction
function sc___prototype11_execute takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerExecute(st___prototype11[i])
endfunction
function sc___prototype11_evaluate takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerEvaluate(st___prototype11[i])

endfunction
function sc___prototype32_execute takes integer i,sound a1,boolean a2,boolean a3 returns nothing
    set f__arg_sound1=a1
    set f__arg_boolean1=a2
    set f__arg_boolean2=a3

    call TriggerExecute(st___prototype32[i])
endfunction
function sc___prototype32_evaluate takes integer i,sound a1,boolean a2,boolean a3 returns nothing
    set f__arg_sound1=a1
    set f__arg_boolean1=a2
    set f__arg_boolean2=a3

    call TriggerEvaluate(st___prototype32[i])

endfunction
function h__StopSound takes sound a0, boolean a1, boolean a2 returns nothing
    //hook: SoundUtils___HookStopSound
    call sc___prototype32_evaluate(1,a0,a1,a2)
call StopSound(a0,a1,a2)
endfunction

//library MathUtils:

function Index2D takes integer v1,integer v2,integer max2 returns integer
    return v1 * max2 + v2
endfunction

function Index3D takes integer v1,integer v2,integer v3,integer max2,integer max3 returns integer
    return v1 * max2 * max3 + v2 * max3 + v3
endfunction

function PolarProjectionX takes real x,real angle,real distance returns real
    return x + distance * Cos(angle * bj_DEGTORAD)
endfunction

function PolarProjectionY takes real y,real angle,real distance returns real
    return y + distance * Sin(angle * bj_DEGTORAD)
endfunction

function AngleBetweenCoordinatesRad takes real x1,real y1,real x2,real y2 returns real
    return Atan2(y2 - y1, x2 - x1)
endfunction

// Utilities already uses the identifier AngleBetweenCoordinates.
function AngleBetweenCoordinatesDeg takes real x1,real y1,real x2,real y2 returns real
    return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
endfunction

function AngleBetweenUnitsDeg takes unit whichUnit0,unit whichUnit1 returns real
    return AngleBetweenCoordinatesDeg(GetUnitX(whichUnit0) , GetUnitY(whichUnit0) , GetUnitX(whichUnit1) , GetUnitY(whichUnit1))
endfunction

// Utilities already uses the identifier DistanceBetweenCoordinates.
function DistBetweenCoordinates takes real x1,real y1,real x2,real y2 returns real
    local real dx= x2 - x1
    local real dy= y2 - y1
    return SquareRoot(dx * dx + dy * dy)
endfunction

function DistanceBetweenUnits takes unit whichUnit0,unit whichUnit1 returns real
    return DistBetweenCoordinates(GetUnitX(whichUnit0) , GetUnitY(whichUnit0) , GetUnitX(whichUnit1) , GetUnitY(whichUnit1))
endfunction

function DistanceBetweenUnitAndPoint takes unit whichUnit0,real x,real y returns real
    return DistBetweenCoordinates(GetUnitX(whichUnit0) , GetUnitY(whichUnit0) , x , y)
endfunction

function DistanceBetweenUnitAndItem takes unit whichUnit,item whichItem returns real
    return DistBetweenCoordinates(GetUnitX(whichUnit) , GetUnitY(whichUnit) , GetItemX(whichItem) , GetItemY(whichItem))
endfunction

function DistanceBetweenUnitAndDestructable takes unit whichUnit,destructable whichDestructable returns real
    return DistBetweenCoordinates(GetUnitX(whichUnit) , GetUnitY(whichUnit) , GetDestructableX(whichDestructable) , GetDestructableY(whichDestructable))
endfunction

function IntToPrecentage takes integer v,integer max returns real
    return I2R(v) * 100.0 / I2R(max)
endfunction

function GetRectFromCircle takes real centerX,real centerY,real radius returns rect
    return Rect(centerX - radius, centerY - radius, centerX + radius, centerY + radius)
endfunction


//library MathUtils ends
//library Stack:

//*****************************************************************
//*  STACK
//*
//*  written by: Anitarf
//*
//*  This is an efficient implementation of a stack in vJass. Since
//*  it is based on a linked list, I decided to add common list
//*  methods to the data structure so it can function both as
//*  a stack and a simple linked list.
//*
//*  As a linked list, it has less functionality than Ammorth's
//*  LinkedList, but is considerably faster. Note only that most of
//*  the list methods have O(n) time complexity so they may not be
//*  suitable for operations on very large lists, however due to
//*  their simplicity the list would need to be really large for
//*  this to become a problem.
//*
//*  All stack methods are of course O(1) and as fast as possible.
//*  If you just need a stack, this is definitely the best choice.
//*
//*   set s=Stack.create()  - Instanceates a new Stack object.
//*   call s.destroy()      - Destroys the Stack.
//*
//*  Stack syntax:
//*   call s.push(123)      - Pushes the value 123 on the stack.
//*                           A stack may contain multiple
//*                           instances of the same value.
//*   set i=s.peek()        - Reads the top value of the stack
//*                           and stores it to the variable i.
//*   set i=s.pop()         - Removes the top value from the stack
//*                           and stores it to the variable i.
//*   s.peek()==Stack.EMPTY - Checks if the stack is empty.
//*
//*  List syntax:
//*   call s.add(123)       - Adds the value 123 to the list.
//*                           A list may contain multiple
//*                           instances of the same value.
//*   s.size                - The total number of values on the list.
//*   s.contains(123)       - Checks if the value 123 is on the list.
//*   set n=s.count(123)    - Stores the number of times the value
//*                           123 is on the list to the variable n.
//*   call s.remove(123)    - Removes one instance of the value 123
//*                           from the list. Returns false if
//*                           the value was not found on the list.
//*   call s.purge(123)     - Removes all instances of the value 123
//*                           from the list. Returns the number of
//*                           values that were removed.
//*   set i=s.first         - Reads the first value from the list
//*                           and stores it to the variable i.
//*   set i=s.random        - Reads a random value from the list
//*                           and stores it to the variable i.
//*   set s2=s.copy()       - Makes a copy of the list and stores
//*                           it to the variable s2.
//*   call s.enum(Func,b)   - Calls function Func for all values
//*                           on the list. The function must follow
//*                           the Enum function interface.
//*                           b is a boolean value, if it is true
//*                           then the values will be enumerated
//*                           top to bottom, if false then bottom
//*                           to top.
//*****************************************************************

//processed:     function interface Stack_Enum takes integer value returns nothing

        // Use a totally random number here, the more improbable someone uses it, the better.
        // This is the value that is returned by .pop and .peek methods and .first and .random operators when called on an empty stack.

        // End of calibration.

        
        function s__Stack_push takes integer this,integer i returns nothing
            // Get an index from the list of free indexes.
            local integer n=s__Stack_free
            set s__Stack_free=s__Stack_next[n]
            // Extend the list of free indexes if needed.
            if s__Stack_free == 0 then
                set s__Stack_free=n + 1
            endif
            // Store the value to the index.
            set s__Stack_value[n]=i
            // Add index to the top of the stack.
            set s__Stack_next[n]=s__Stack_top[this]
            set s__Stack_top[this]=n
            set s__Stack_size[this]=s__Stack_size[this] + 1
        endfunction
        function s__Stack_pop takes integer this returns integer
            // Get the top index of stack.
            local integer n=s__Stack_top[this]
            // Safety check in case a user pops an empty stack.
            if n == 0 then
                return s__Stack_EMPTY
            endif
            // Remove the top index from stack.
            set s__Stack_top[this]=s__Stack_next[n]
            set s__Stack_size[this]=s__Stack_size[this] - 1
            // Add the index to the list of free indexes.
            set s__Stack_next[n]=s__Stack_free
            set s__Stack_free=n
            // Return the value.
            return s__Stack_value[n]
        endfunction
        function s__Stack_peek takes integer this returns integer
            // Read the value of the top index.
            return s__Stack_value[s__Stack_top[this]]
        endfunction


        function s__Stack_add takes integer this,integer value returns nothing
            call s__Stack_push(this,value)
        endfunction
        function s__Stack_contains takes integer this,integer value returns boolean
            // Get the first index of the list.
            local integer i=s__Stack_top[this]
            // Search through the list.
            loop
                // Stop the search when the end of the list is reached.
                exitwhen i == 0
                // Stop the search if the value is found.
                if s__Stack_value[i] == value then
                    return true
                endif
                // Get the next index of the list.
                set i=s__Stack_next[i]
            endloop
            return false
        endfunction
        function s__Stack_count takes integer this,integer value returns integer
            local integer count=0
            // Get the first index of the list.
            local integer i=s__Stack_top[this]
            // Search through the list.
            loop
                // Stop the search when the end of the list is reached.
                exitwhen i == 0
                // Increase the count if the value is found.
                if s__Stack_value[i] == value then
                    set count=count + 1
                endif
                // Get the next index of the list.
                set i=s__Stack_next[i]
            endloop
            return count
        endfunction
        function s__Stack__get_first takes integer this returns integer
            return (s__Stack_value[s__Stack_top[(this)]]) // INLINED!!
        endfunction
        function s__Stack__get_random takes integer this returns integer
            local integer r=GetRandomInt(1, s__Stack_size[this])
            // Get the first index of the list.
            local integer i=s__Stack_top[this]
            // Loop through the list.
            loop
                // Stop the loop after a random amount of repeats.
                set r=r - 1
                exitwhen r == 0 or i == 0
                // Get the next index of the list.
                set i=s__Stack_next[i]
            endloop
            return s__Stack_value[i]
        endfunction
        function s__Stack_remove takes integer this,integer value returns boolean
            // Get the first index of the list.
            local integer i1=s__Stack_top[this]
            local integer i2
            // Check if the first index holds the value.
            if s__Stack_value[i1] == value then
                call s__Stack_pop(this)
                return true
            endif
            // Search through the rest of the list.
            loop
                set i2=s__Stack_next[i1]
                // Stop the search when the end of the list is reached.
                exitwhen i2 == 0
                // Check if the next index holds the value.
                if s__Stack_value[i2] == value then
                    // Remove the index from the stack.
                    set s__Stack_next[i1]=s__Stack_next[i2]
                    // Add the removed index to the list of free indexes.
                    set s__Stack_next[i2]=s__Stack_free
                    set s__Stack_free=i2
                    set s__Stack_size[this]=s__Stack_size[this] - 1
                    return true
                endif
                set i1=i2
            endloop
            return false
        endfunction
        function s__Stack_purge takes integer this,integer value returns integer
            local integer count=0
            local integer i1
            local integer i2
            // If the first index holds the value, pop it.
            loop
                // If the list is empty, return.
                if s__Stack_top[this] == 0 then
                    return count
                endif
                // Repeat until the first index doesn't hold the value.
                exitwhen s__Stack_value[s__Stack_top[this]] != value
                call s__Stack_pop(this)
                set count=count + 1
            endloop
            // Get the first index of the list.
            set i1=s__Stack_top[this]
            // Search through the rest of the list.
            loop
                set i2=s__Stack_next[i1]
                // Stop the search when the end of the list is reached.
                exitwhen i2 == 0
                // Check if the next index holds the value.
                if s__Stack_value[i2] == value then
                    // Remove the index from the stack.
                    set s__Stack_next[i1]=s__Stack_next[i2]
                    // Add the removed index to the list of free indexes.
                    set s__Stack_next[i2]=s__Stack_free
                    set s__Stack_free=i2
                    set s__Stack_size[this]=s__Stack_size[this] - 1
                    set count=count + 1
                else
                    set i1=i2
                endif
            endloop
            return count
        endfunction
        function s__Stack_enum takes integer this,integer f,boolean top2bottom returns nothing
            local integer array value
            // Get the first index of the list.
            local integer i1=s__Stack_top[this]
            local integer i2=0
            // Populate the array.
            loop
                exitwhen i1 == 0
                set value[i2]=s__Stack_value[i1]
                set i2=i2 + 1
                set i1=s__Stack_next[i1]
            endloop
            // Call the Enum function for each value in the array.
            set i1=i2 - 1
            loop
                exitwhen i2 == 0
                set i2=i2 - 1
                // Enumerate in which direction?
                if top2bottom then
                    call sc___prototype11_evaluate(f,value[i1 - i2])
                else
                    call sc___prototype11_evaluate(f,value[i2])
                endif
            endloop
        endfunction
        function s__Stack_copy takes integer this returns integer
            local integer that=s__Stack__allocate()
            // Get the first index of the list.
            local integer i1=s__Stack_top[this]
            local integer i2
            // Add a dummy index to the top of the new list.
            call s__Stack_push(that,0)
            set i2=s__Stack_top[that]
            loop
                exitwhen i1 == 0
                // Get an index from the list of free indexes and add it at the end of the list.
                set s__Stack_next[i2]=s__Stack_free
                set i2=s__Stack_next[i2]
                set s__Stack_free=s__Stack_next[i2]
                // Extend the list of free indexes if needed.
                if s__Stack_free == 0 then
                    set s__Stack_free=i2 + 1
                endif
                // Copy the value to the new index.
                set s__Stack_value[i2]=s__Stack_value[i1]
                set i1=s__Stack_next[i1]
            endloop
            // End the new list correctly.
            set s__Stack_next[i2]=0
            // Remove the dummy index.
            call s__Stack_pop(that)
            // Copy the size value to the new list.
            set s__Stack_size[that]=s__Stack_size[this]
            return that
        endfunction


        function s__Stack_onDestroy takes integer this returns nothing
            local integer n
            // Remove all remaining indexes from the stack.
            loop
                // Get the top index.
                set n=s__Stack_top[this]
                exitwhen n == 0
                // Remove it from the stack.
                set s__Stack_top[this]=s__Stack_next[n]
                // Add it to the list of free indexes.
                set s__Stack_next[n]=s__Stack_free
                set s__Stack_free=n
            endloop
        endfunction

//Generated destructor of Stack
function s__Stack_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Stack_V[this]!=-1) then
        return
    endif
    call s__Stack_onDestroy(this)
    set si__Stack_V[this]=si__Stack_F
    set si__Stack_F=this
endfunction
        function s__Stack_onInit takes nothing returns nothing
            // Store the EMPTY value to index 0 to make .peek inline friendly.
            set s__Stack_value[0]=s__Stack_EMPTY
        endfunction

//library Stack ends
//library StringUtils:

function B2S takes boolean b returns string
    if ( b ) then
        return "true"
    endif
    return "false"
endfunction

function B2Option takes boolean b returns string
    if ( b ) then
        return GetLocalizedString("ON")
    endif
    return GetLocalizedString("OFF")
endfunction

function StringRepeat takes string str,integer count returns string
    local string result= ""
    local integer i= 0
    loop
        exitwhen ( i >= count )
        set result=result + str
        set i=i + 1
    endloop
    return result
endfunction

function StringReplace takes string source,string match,string replace returns string
    local integer i= 0
    local integer max= StringLength(source)
    local integer matchLength= StringLength(match)
    local integer index= 0
    local string result= ""
    loop
        exitwhen ( i == max )
        set index=i + matchLength
        if ( SubString(source, i, index) == match ) then
            set result=result + replace
            set i=index
        else
            set index=i + 1
            set result=result + SubString(source, i, index)
            set i=index
        endif
    endloop
    return result
endfunction

function StringRemove takes string source,string match returns string
    return StringReplace(source , match , "")
endfunction

function StringStartsWith takes string source,string start returns boolean
    local integer i= 0
    local integer max= StringLength(start)
    local integer max2= StringLength(source)
    loop
        exitwhen ( i == max or i == max2 )

        if ( SubString(source, i, i + 1) != SubString(start, i, i + 1) ) then
            return false
        endif

        set i=i + 1
    endloop

    return i == max
endfunction

function StringRemoveFromStart takes string source,string start returns string
    if ( StringStartsWith(source , start) ) then
        return SubString(source, StringLength(start), StringLength(source))
    endif

    return source
endfunction

function IndexOfStringEx takes string symbol,string source,integer start returns integer
    local integer symbolLength= StringLength(symbol)
    local integer length= StringLength(source)
    local integer i2= 0
    local integer i= start
    //call BJDebugMsg("Checking for symbol: " + symbol + " in source " + source)
    loop
        set i2=i + symbolLength
        exitwhen ( i >= length or i2 > length )
        if ( SubString(source, i, i2) == symbol ) then
            //call BJDebugMsg("Index: " + I2S(i))
            return i
        endif
        set i=i + 1
    endloop

    //call BJDebugMsg("Missing symbol " + symbol + " in source " + source)

    return - 1
endfunction

function IndexOfString takes string symbol,string source returns integer
    return IndexOfStringEx(symbol , source , 0)
endfunction

function StringIndexOf takes string symbol,string source returns integer
    return (IndexOfStringEx((symbol ) , ( source) , 0)) // INLINED!!
endfunction

function StringCount takes string source,string symbol returns integer
    local integer result= 0
    local integer symbolLength= StringLength(symbol)
    local integer length= StringLength(source)
    local integer i= 0
    //call BJDebugMsg("Checking for symbol: " + symbol + " in source " + source)
    loop
        exitwhen ( i == length )
        if ( SubString(source, i, i + symbolLength) == symbol ) then
            //call BJDebugMsg("Index: " + I2S(i))
            set result=result + 1
            set i=i + symbolLength
        else
            set i=i + 1
        endif
    endloop

    //call BJDebugMsg("Missing symbol " + symbol + " in source " + source)

    return result
endfunction


function StringSplit takes string source,integer index,string separator returns string
    local string result= null
    local integer currentIndex= 0
    local integer separatorLength= StringLength(separator)
    local integer length= StringLength(source)
    local integer i= 0
    loop
        exitwhen ( i == length or currentIndex > index )
        if ( SubString(source, i, i + separatorLength) == separator ) then
            if ( currentIndex == index and result == null ) then
                set result=""
            endif
            set currentIndex=currentIndex + 1
            set i=i + separatorLength
        else
            if ( currentIndex == index ) then
                if ( result == null ) then
                    set result=""
                endif
                set result=result + SubString(source, i, i + 1)
            endif
            set i=i + 1
        endif
    endloop

    return result
endfunction


function StringTokenEx takes string source,integer index,string separator,boolean toTheEnd returns string
    local string result= ""
    local boolean inWhitespace= false
    local integer currentIndex= 0
    local integer separatorLength= StringLength(separator)
    local integer length= StringLength(source)
    local integer i= 0
    loop
        exitwhen ( i == length or currentIndex > index )
        if ( SubString(source, i, i + separatorLength) == separator and ( not toTheEnd or currentIndex < index ) ) then
            if ( not inWhitespace ) then
                set inWhitespace=true
                set currentIndex=currentIndex + 1
                set i=i + separatorLength
            endif
        else
            if ( currentIndex == index ) then
                set result=result + SubString(source, i, i + 1)
            endif
            set inWhitespace=false
            set i=i + 1
        endif
    endloop

    return result
endfunction

function StringToken takes string source,integer index returns string
    return StringTokenEx(source , index , " " , false)
endfunction

function StringTokenEnteredChatMessageEx takes integer index,boolean toTheEnd returns string
    return StringTokenEx(GetEventPlayerChatString() , index , " " , toTheEnd)
endfunction

function StringTokenEnteredChatMessage takes integer index returns string
    return (StringTokenEx((GetEventPlayerChatString() ) , ( index) , " " , false)) // INLINED!!
endfunction

function RandomizeString takes string source returns string
    local string result= ""
    local integer sourcePosition= 0
    local integer max= StringLength(source)
    loop
        exitwhen ( max == 0 )
        set sourcePosition=GetRandomInt(0, max - 1)
        set result=result + SubString(source, sourcePosition, sourcePosition + 1)
        set source=SubString(source, 0, sourcePosition) + SubString(source, sourcePosition + 1, max)
        set max=StringLength(source)
    endloop

    return result
endfunction

function StringRandomize takes string source returns string
    return RandomizeString(source)
endfunction

function I2SW takes integer i,integer width returns string
    local integer a= 0
    local string result= ""
    local integer max= 0
    if ( width > 0 ) then
        set a=IAbsBJ(i)
        set max=R2I(Pow(R2I(10), R2I(width - 1)))
        if ( i < 0 ) then
            set result=result + "-"
        endif
        loop
            if ( a >= max or max <= 1 ) then
                set result=result + I2S(a)
                exitwhen ( true )
            else
                set result=result + "0"
                set max=max / 10
            endif
        endloop
    else
        set result=I2S(i)
    endif
    return result
endfunction

function FormatTimeString takes integer seconds returns string
    local integer minutes= seconds / 60
    local integer hours= minutes / 60
    local integer hoursInMinutes= hours * 60
    local integer minutesInSeconds= minutes * 60

    set minutes=minutes - hoursInMinutes
    set seconds=seconds - minutesInSeconds

    if ( hours > 0 ) then
        return I2SW(hours , 2) + ":" + I2SW(minutes , 2) + ":" + I2SW(seconds , 2)
    elseif ( minutes > 0 ) then
        return I2SW(minutes , 2) + ":" + I2SW(seconds , 2)
    else
        return I2S(seconds) + " seconds"
    endif
endfunction

function FormatTime takes real time returns string
    local integer hours= R2I(time / 3600.0)
    local integer minutes=  R2I(time - hours * 3600) / 60
    local integer seconds= R2I(time - hours * 3600 - minutes * 60)
    
    return I2SW(hours , 2) + ":" + I2SW(minutes , 2) + ":" + I2SW(seconds , 2)
endfunction

function IsCharacterNumber takes string c returns boolean
    return c == "0" or c == "1" or c == "2" or c == "3" or c == "4" or c == "5" or c == "6" or c == "7" or c == "8" or c == "9"
endfunction

function IsStringNumber takes string whichString returns boolean
    local integer length= StringLength(whichString)
    local integer i= 0
    loop
        exitwhen ( i == length )
        if ( not IsCharacterNumber(SubString(whichString, i, i + 1)) ) then
            return false
        endif
        set i=i + 1
    endloop
    return true
endfunction


function InsertLineBreaks takes string whichString,integer maxLineLength returns string
    local integer i
    local string result
    local integer max= StringLength(whichString)
    if ( max <= maxLineLength ) then
        return whichString
    endif
    set result=""
    set i=maxLineLength
    loop
        exitwhen ( i > max )
        set result=result + SubString(whichString, i - maxLineLength, i) + "\n"
        set i=i + maxLineLength
    endloop

    if ( i < max ) then
        set result=result + SubString(whichString, i - maxLineLength, max)
    endif

    return result
endfunction


function GetExternalString takes integer index returns string
    if ( index < 0 ) then
        return ""
    elseif ( index < 10 ) then
        return GetLocalizedString("TRIGSTR_00" + I2S(index))
    elseif ( index < 100 ) then
        return GetLocalizedString("TRIGSTR_0" + I2S(index))
    else
        return GetLocalizedString("TRIGSTR_" + I2S(index))
    endif
endfunction


//library StringUtils ends
//library TimerUtils:
//*********************************************************************
//* TimerUtils (red+blue+orange flavors for 1.24b+)
//* ----------
//*
//*  To implement it , create a custom text trigger called TimerUtils
//* and paste the contents of this script there.
//*
//*  To copy from a map to another, copy the trigger holding this
//* library to your map.
//*
//* (requires vJass)   More scripts: htt://www.wc3c.net
//*
//* For your timer needs:
//*  * Attaching
//*  * Recycling (with double-free protection)
//*
//* set t=NewTimer()      : Get a timer (alternative to CreateTimer)
//* ReleaseTimer(t)       : Relese a timer (alt to DestroyTimer)
//* SetTimerData(t,2)     : Attach value 2 to timer
//* GetTimerData(t)       : Get the timer's value.
//*                         You can assume a timer's value is 0
//*                         after NewTimer.
//*
//* Multi-flavor:
//*    Set USE_HASH_TABLE to true if you don't want to complicate your life.
//*
//* If you like speed and giberish try learning about the other flavors.
//*
//********************************************************************

//================================================================

    //==================================================================================================

    //It is dependent on jasshelper's recent inlining optimization in order to perform correctly.
    function SetTimerData takes timer t,integer value returns nothing













            // new red





            set s__TimerUtils___data[GetHandleId(t) - TimerUtils___OFFSET]= value

    endfunction

    function GetTimerData takes timer t returns integer













            // new red





            return s__TimerUtils___data[GetHandleId(t) - TimerUtils___OFFSET]

    endfunction

    //==========================================================================================

    //==========================================================================================
    function NewTimer takes nothing returns timer
        if ( TimerUtils___tN == 0 ) then
            //If this happens then the QUANTITY rule has already been broken, try to fix the
            // issue, else fail.

                set s__TimerUtils___tT[0]= CreateTimer()







                    if ( GetHandleId(s__TimerUtils___tT[0]) - TimerUtils___OFFSET < 0 ) or ( GetHandleId(s__TimerUtils___tT[0]) - TimerUtils___OFFSET >= TimerUtils___ARRAY_SIZE ) then
                        //all right, couldn't fix it
                        call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
                        return null
                    endif


        else
            set TimerUtils___tN=TimerUtils___tN - 1
        endif
        set s__TimerUtils___data[GetHandleId((s__TimerUtils___tT[TimerUtils___tN] )) - TimerUtils___OFFSET]= ( 0) // INLINED!!
     return s__TimerUtils___tT[TimerUtils___tN]
    endfunction

    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if ( t == null ) then
            return
        endif
        if ( TimerUtils___tN == TimerUtils___ARRAY_SIZE ) then
            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if ( (s__TimerUtils___data[GetHandleId((t)) - TimerUtils___OFFSET]) == TimerUtils___HELD ) then // INLINED!!
                return
            endif
            set s__TimerUtils___data[GetHandleId((t )) - TimerUtils___OFFSET]= ( TimerUtils___HELD) // INLINED!!
            set s__TimerUtils___tT[TimerUtils___tN]= t
            set TimerUtils___tN=TimerUtils___tN + 1
        endif
    endfunction

    function TimerUtils___init takes nothing returns nothing
     local integer i=0
     local integer o=- 1
     local boolean oops= false
     










            loop
                set i=0
                loop
                    exitwhen ( i == TimerUtils___QUANTITY )
                    set s__TimerUtils___tT[i]= CreateTimer()
                    if ( i == 0 ) then
                        set TimerUtils___VOFFSET=GetHandleId(s__TimerUtils___tT[i])



                            set o=TimerUtils___OFFSET

                    endif
                    if ( GetHandleId(s__TimerUtils___tT[i]) - o >= TimerUtils___ARRAY_SIZE ) then
                        exitwhen true
                    endif
                    if ( GetHandleId(s__TimerUtils___tT[i]) - o >= 0 ) then
                        set i=i + 1
                    endif
                endloop
                set TimerUtils___tN=i
                exitwhen ( TimerUtils___tN == TimerUtils___QUANTITY )
                set oops=true
                exitwhen not TimerUtils___USE_FLEXIBLE_OFFSET
            endloop
            
            if ( oops ) then











            endif


    endfunction


//library TimerUtils ends
//library CameraPosSync:


function CameraPosSync___RegisterSyncEventEnum takes nothing returns nothing
    call BlzTriggerRegisterPlayerSyncEvent(CameraPosSync___syncTrigger, GetEnumPlayer(), CameraPosSync_PREFIX, false)
endfunction

function CameraPosSync___TriggerActionSync takes nothing returns nothing
    local string data= BlzGetTriggerSyncData()
    local integer playerId= GetPlayerId(GetTriggerPlayer())
    if ( StringStartsWith(data , "SourceX_") ) then
        set cameraEyeX[playerId]=S2R(StringRemoveFromStart(data , "SourceX_"))
    elseif ( StringStartsWith(data , "SourceY_") ) then
        set cameraEyeY[playerId]=S2R(StringRemoveFromStart(data , "SourceY_"))
    elseif ( StringStartsWith(data , "SourceZ_") ) then
        set cameraEyeZ[playerId]=S2R(StringRemoveFromStart(data , "SourceZ_"))
    elseif ( StringStartsWith(data , "TargetX_") ) then
        set cameraTargetX[playerId]=S2R(StringRemoveFromStart(data , "TargetX_"))
    elseif ( StringStartsWith(data , "TargetY_") ) then
        set cameraTargetY[playerId]=S2R(StringRemoveFromStart(data , "TargetY_"))
    elseif ( StringStartsWith(data , "TargetZ_") ) then
        set cameraTargetZ[playerId]=S2R(StringRemoveFromStart(data , "TargetZ_"))
    elseif ( StringStartsWith(data , "Distance_") ) then
        set cameraDistance[playerId]=S2R(StringRemoveFromStart(data , "Distance_"))
    endif
endfunction

function CameraPosSync___SyncEnum takes nothing returns nothing
    if ( GetLocalPlayer() == GetEnumPlayer() ) then
        call BlzSendSyncData(CameraPosSync_PREFIX, "SourceX_" + R2S(GetCameraEyePositionX()))
        call BlzSendSyncData(CameraPosSync_PREFIX, "SourceY_" + R2S(GetCameraEyePositionY()))
        call BlzSendSyncData(CameraPosSync_PREFIX, "SourceZ_" + R2S(GetCameraEyePositionZ()))
        call BlzSendSyncData(CameraPosSync_PREFIX, "TargetX_" + R2S(GetCameraTargetPositionX()))
        call BlzSendSyncData(CameraPosSync_PREFIX, "TargetY_" + R2S(GetCameraTargetPositionY()))
        call BlzSendSyncData(CameraPosSync_PREFIX, "TargetZ_" + R2S(GetCameraTargetPositionZ()))
        call BlzSendSyncData(CameraPosSync_PREFIX, "Distance_" + R2S(GetCameraField(CAMERA_FIELD_TARGET_DISTANCE)))
    endif
endfunction

function CameraPosSync___TimerFunctionSync takes nothing returns nothing
    call ForForce(GetPlayersAll(), function CameraPosSync___SyncEnum)
endfunction

function CameraPosSync___Init takes nothing returns nothing
    call ForForce(GetPlayersAll(), function CameraPosSync___RegisterSyncEventEnum)
    call TriggerAddAction(CameraPosSync___syncTrigger, function CameraPosSync___TriggerActionSync)
    call TimerStart(CreateTimer(), CameraPosSync_SYNC_INTERVAL, true, function CameraPosSync___TimerFunctionSync)
endfunction


//library CameraPosSync ends
//library SoundUtils:
//******************************************************************************
//* BY: Rising_Dusk
//* 
//* Sounds are a very picky datatype in WC3. They have many quirks that one must
//* account for in order to use them, and simply using the internal WE Sound
//* Editor isn't enough because the sounds it makes can't be played multiple
//* times at once. 3-D sounds are also very tricky because there are different
//* WC3 sound options that a user can have activated where certain sounds will
//* or will not work. This library attempts to streamline the handling of sounds
//* so that it is less likely to confuse you or cause problems.
//* 
//* The .mp3 format can be used for 3-D sounds, but there is one problem that
//* must be noted. If your computer supports the "Dolby Surround" sound option
//* in WC3 and you have it selected, then .mp3 files will work for 3-D sounds.
//* If you don't, however, they may not work depending on what you do have
//* selected and what is available for your computer. The .wav format works on
//* all possible settings, making them excellent for general use. This library
//* can interface with sounds of either type.
//* 
//* Known issues with sounds that this library resolves:
//*     - A given sound variable can only be played once at a time. In order to
//*       play a sound type multiple times at once, you need multiple variables.
//*     - A sound cannot be played at the same instant that it is created.
//* 
//* The DefineSound function defines a sound type based on some basic parameters
//* the user provides. DefineSoundEx is available if the user wants control over
//* all possible parameters, though they won't have an impact most of the time.
//* The duration parameter for DefineSound and DefineSoundEx is in milliseconds,
//* which is consistent with Blizzard's natives. To get the duration of a given
//* sound, open up the WE's Sound Editor, navigate to your sound, and select
//* "Add as Sound." In doing so, it will show its duration in seconds. Multiply
//* that number by 1000 and use it as the duration argument.
//* 
//* This library returns a sound variable with RunSound that you can change the
//* settings of using the standard JASS sound API. The library assigns default
//* values to the parameters for 2-D and 3-D sounds, that way they will run
//* without any further help.
//* 
//* The library automatically allocates, runs, and recycles a sound when you
//* call RunSound. This library will not automatically recycle looping sounds,
//* so you will need to call ReleaseSound on the looping sound when you want it
//* to end.
//* 
//******************************************************************************
//* 
//*    > function DefineSound takes string fileName, integer duration, ...
//*        boolean looping, boolean is3D returns integer
//* 
//* This function defines a sound type with a short list of parameters. The
//* returned integer serves as a SOUND_TYPE for running this type of sound at
//* any other point in a map.
//* 
//*    > function DefineSoundEx takes string fileName, integer duration, ...
//*        boolean looping, boolean is3D, boolean stopwhenoutofrange, ...
//*        integer fadeInRate, integer fadeOutRate, string eaxSetting ...
//*        returns integer
//* 
//* This function serves an identical purpose to DefineSound, but gives the user
//* full control over the entire list of parameters. Similar to DefineSound, the
//* returned integer serves as a SOUND_TYPE for running this type of sound.
//* 
//*    > function RunSound takes integer soundRef returns sound
//* 
//* This function runs a sound with the parameters held within the soundRef
//* integer argument. The soundRef argument is the returned value of DefineSound
//* or DefineSoundEx.
//* 
//*    > function RunSoundOnUnit takes integer soundRef, unit whichUnit returns sound
//* 
//* The same as RunSound, just this function runs a sound of a given type on a
//* specified unit.
//* 
//*    > function RunSoundAtPoint takes integer soundRef, real x, real y, real z returns sound
//* 
//* The same as RunSound, just this function runs a sound of a given type at a
//* specified point in 3D space.
//* 
//*    > function RunSoundForPlayer takes integer soundRef, player p returns sound
//* 
//* The same as RunSound, just this function runs a sound of a given type only
//* for the specified player.
//* 
//*    > function ReleaseSound takes sound s returns boolean
//* 
//* This function need only be called on looping sounds. If a sound is not
//* looping, it will be released and recycled on its own. This function should
//* be used on looping sounds when you want them to end.
//* 
//* Example usage:
//*     set SOUND_TYPE = DefineSound("Sound\\Path.wav", 300, false, true)
//*     call RunSound(SOUND_TYPE)
//*     call RunSoundOnUnit(SOUND_TYPE, SomeUnit)
//*     call RunSoundAtPoint(SOUND_TYPE, x, y, z)
//*     call RunSoundForPlayer(SOUND_TYPE, Player(5))
//*     call ReleaseSound(SomeLoopingSound)
//* 

//Struct for each sound type
    //Stack associated to each struct
    
    //Sound Settings for this sound type
    
    function s__SoundUtils___soundhelper_create takes string fileName,integer duration,boolean looping,boolean is3D,boolean stopwhenoutofrange,integer fadeInRate,integer fadeOutRate,string eaxSetting returns integer
        local integer sh= s__SoundUtils___soundhelper__allocate()
        //Load the parameters so the sound can be created later as necessary
        set s__SoundUtils___soundhelper_fileName[sh]=fileName
        set s__SoundUtils___soundhelper_duration[sh]=duration
        set s__SoundUtils___soundhelper_looping[sh]=looping
        set s__SoundUtils___soundhelper_is3D[sh]=is3D
        set s__SoundUtils___soundhelper_stopwhenoutofrange[sh]=stopwhenoutofrange
        set s__SoundUtils___soundhelper_fadeInRate[sh]=fadeInRate
        set s__SoundUtils___soundhelper_fadeOutRate[sh]=fadeOutRate
        set s__SoundUtils___soundhelper_eaxSetting[sh]=eaxSetting
        //Create the stack for the struct
        set s__SoundUtils___soundhelper_sta[sh]=s__Stack__allocate()
        return sh
    endfunction

//Struct for holding data for the sound recycling
    
    function s__SoundUtils___soundrecycler_create takes sound whichSound,integer soundRef returns integer
        local integer sr= s__SoundUtils___soundrecycler__allocate()
        set s__SoundUtils___soundrecycler_t[sr]=NewTimer()
        set s__SoundUtils___soundrecycler_s[sr]=whichSound
        set s__SoundUtils___soundrecycler_sh[sr]=soundRef
        set s__TimerUtils___data[GetHandleId((s__SoundUtils___soundrecycler_t[sr] )) - TimerUtils___OFFSET]= ( (sr)) // INLINED!!
        
        //Hook the value to the soundRef and whichSound
        call SaveInteger(SoundUtils___rt, soundRef, GetHandleId(whichSound), (sr))
        return sr
    endfunction
    function s__SoundUtils___soundrecycler_onDestroy takes integer this returns nothing
        call RemoveSavedInteger(SoundUtils___rt, s__SoundUtils___soundrecycler_sh[this], GetHandleId(s__SoundUtils___soundrecycler_s[this]))
        call ReleaseTimer(s__SoundUtils___soundrecycler_t[this])
    endfunction

//Generated destructor of SoundUtils___soundrecycler
function s__SoundUtils___soundrecycler_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__SoundUtils___soundrecycler_V[this]!=-1) then
        return
    endif
    call s__SoundUtils___soundrecycler_onDestroy(this)
    set si__SoundUtils___soundrecycler_V[this]=si__SoundUtils___soundrecycler_F
    set si__SoundUtils___soundrecycler_F=this
endfunction

//******************************************************************************

function SoundUtils___HookStopSound takes sound soundHandle,boolean killWhenDone,boolean fadeOut returns nothing
    local integer id= GetHandleId(soundHandle)
    local integer soundRef= 0
    local integer sr= 0
    if HaveSavedInteger(SoundUtils___ht, 0, id) then //Sound is from stacks
        set soundRef=LoadInteger(SoundUtils___ht, 0, id)
        if HaveSavedInteger(SoundUtils___rt, soundRef, id) then //Sound has a recycler
            set sr=(LoadInteger(SoundUtils___rt, soundRef, id))
            set s__SoundUtils___soundrecycler_stopped[sr]=true
        endif
        if killWhenDone then
        endif
    endif
endfunction

//processed hook: hook StopSound SoundUtils___HookStopSound

function SoundUtils___HookKillSoundWhenDone takes sound soundHandle returns nothing
    if HaveSavedInteger(SoundUtils___ht, 0, GetHandleId(soundHandle)) then
        call BJDebugMsg("SoundUtils_Warning: (KillSoundWhenDone) Destroying a sound in the stack")
    endif
endfunction

//******************************************************************************

function DefineSoundEx takes string fileName,integer duration,boolean looping,boolean is3D,boolean stopwhenoutofrange,integer fadeInRate,integer fadeOutRate,string eaxSetting returns integer
    return (s__SoundUtils___soundhelper_create(fileName , duration , looping , is3D , stopwhenoutofrange , fadeInRate , fadeOutRate , eaxSetting))
endfunction
function DefineSound takes string fileName,integer duration,boolean looping,boolean is3D returns integer
    return (s__SoundUtils___soundhelper_create((fileName ) , ( duration ) , ( looping ) , ( is3D ) , ( true ) , ( 10 ) , ( 10 ) , ( "CombatSoundsEAX"))) // INLINED!!
endfunction

function ReleaseSound takes sound s returns boolean
    local integer id= GetHandleId(s)
    local integer soundRef= 0
    local integer sh= 0
    local integer sr= 0
    
    if s == null then
        return false
    elseif not HaveSavedInteger(SoundUtils___ht, 0, id) then
        return false
    endif
    
    set soundRef=LoadInteger(SoundUtils___ht, 0, id)
    set sh=(soundRef)
    
    call h__StopSound(s, false, true) //Stop the sound
    call s__Stack_push(s__SoundUtils___soundhelper_sta[sh],id) //Return it to the stack
    call SaveSoundHandle(SoundUtils___st, soundRef, id, s) //Save it to hashtable
    if not s__SoundUtils___soundhelper_looping[sh] then
        //soundrecycler only exists for non-looping sounds
        set sr=(LoadInteger(SoundUtils___rt, soundRef, id))
        call s__SoundUtils___soundrecycler_deallocate(sr) //Destroy recycler helper
    endif
    return true
endfunction

function SoundUtils___Recycle takes nothing returns nothing
    local integer sr= ((s__TimerUtils___data[GetHandleId((GetExpiredTimer())) - TimerUtils___OFFSET])) // INLINED!!
    local integer sh= (s__SoundUtils___soundrecycler_sh[sr])
    local integer id= GetHandleId(s__SoundUtils___soundrecycler_s[sr])
    
    call h__StopSound(s__SoundUtils___soundrecycler_s[sr], false, true) //Stop the sound
    call s__Stack_push(s__SoundUtils___soundhelper_sta[sh],id) //Return it to the stack
    call SaveSoundHandle(SoundUtils___st, (sh), id, s__SoundUtils___soundrecycler_s[sr]) //Save it to hashtable
    call s__SoundUtils___soundrecycler_deallocate(sr) //Destroy recycler helper
endfunction

function SoundUtils___Run takes nothing returns nothing
    local integer sr= ((s__TimerUtils___data[GetHandleId((GetExpiredTimer())) - TimerUtils___OFFSET])) // INLINED!!
    local integer sh= (s__SoundUtils___soundrecycler_sh[sr])
    
    if not s__SoundUtils___soundrecycler_stopped[sr] then
        call StartSound(s__SoundUtils___soundrecycler_s[sr]) //Play sound here
    endif
    if not s__SoundUtils___soundhelper_looping[sh] and not s__SoundUtils___soundrecycler_stopped[sr] then
        call TimerStart(s__SoundUtils___soundrecycler_t[sr], s__SoundUtils___soundhelper_duration[sh] * 0.001, false, function SoundUtils___Recycle)
    else
        call s__SoundUtils___soundrecycler_deallocate(sr)
    endif
endfunction

function RunSound takes integer soundRef returns sound
    local sound s= null
    local integer i= 0
    local integer sh= (soundRef)
    local integer sr= 0
    
    if soundRef <= 0 then
        return null
    endif
    //Check if the stack is empty
    if (s__Stack_value[s__Stack_top[(s__SoundUtils___soundhelper_sta[sh])]]) == s__Stack_EMPTY then // INLINED!!
        //Create a new sound for the stack
        set s=CreateSound(s__SoundUtils___soundhelper_fileName[sh], s__SoundUtils___soundhelper_looping[sh], s__SoundUtils___soundhelper_is3D[sh], s__SoundUtils___soundhelper_stopwhenoutofrange[sh], s__SoundUtils___soundhelper_fadeInRate[sh], s__SoundUtils___soundhelper_fadeOutRate[sh], s__SoundUtils___soundhelper_eaxSetting[sh])
        //Attach the type to the sound for future reference
        call SaveInteger(SoundUtils___ht, 0, GetHandleId(s), (sh))
        call SetSoundDuration(s, s__SoundUtils___soundhelper_duration[sh])
        
        //Stuff that must be performed immediately upon creation of sounds
        call SetSoundChannel(s, 5)
        call SetSoundVolume(s, 127)
        call SetSoundPitch(s, 1.)
        if s__SoundUtils___soundhelper_is3D[sh] then
            //These are settings necessary for 3-D sounds to function properly
            //You can change them at will outside of this function
            call SetSoundDistances(s, 600., 10000.)
            call SetSoundDistanceCutoff(s, 3000.)
            call SetSoundConeAngles(s, 0., 0., 127)
            call SetSoundConeOrientation(s, 0., 0., 0.)
        endif
        
        //Start sound after a delay because it was created here
        set sr=s__SoundUtils___soundrecycler_create(s , soundRef)
        call TimerStart(s__SoundUtils___soundrecycler_t[sr], 0.001, false, function SoundUtils___Run)
    else
        //Allocate a sound from the stack
        set i=s__Stack_pop(s__SoundUtils___soundhelper_sta[sh])
        if not HaveSavedHandle(SoundUtils___st, soundRef, i) then
            return null
        endif
        set s=LoadSoundHandle(SoundUtils___st, soundRef, i)
        call RemoveSavedInteger(SoundUtils___st, soundRef, i)
        call SetSoundVolume(s, 127) //Start volume at max
        
        //Start it here since it wasn't created here
        call StartSound(s)
        //Recycle the sound in a timer callback after it's finished if nonlooping
        if not s__SoundUtils___soundhelper_looping[sh] then
            set sr=s__SoundUtils___soundrecycler_create(s , soundRef)
            call TimerStart(s__SoundUtils___soundrecycler_t[sr], s__SoundUtils___soundhelper_duration[sh] * 0.001, false, function SoundUtils___Recycle)
        endif
    endif
    return s
endfunction

function RunSoundOnUnit takes integer soundRef,unit whichUnit returns sound
    local sound s= RunSound(soundRef)
    call AttachSoundToUnit(s, whichUnit)
    return s
endfunction

function RunSoundAtPoint takes integer soundRef,real x,real y,real z returns sound
    local sound s= RunSound(soundRef)
    call SetSoundPosition(s, x, y, z)
    return s
endfunction

function RunSoundForPlayer takes integer soundRef,player p returns sound
    local sound s= RunSound(soundRef)
    if GetLocalPlayer() != p then
        call SetSoundVolume(s, 0)
    else
        call SetSoundVolume(s, 127)
    endif
    return s
endfunction

//library SoundUtils ends
//library Gunship:

function GetInfoText takes player whichPlayer returns string
    local integer convertedPlayerId= GetConvertedPlayerId(whichPlayer)
    local string firesMsg= ""
    if ( udg_GunshipFires[convertedPlayerId] ) then
        set firesMsg=" (Firing)"
    endif
    return GetUnitName(udg_Gunship[convertedPlayerId]) + firesMsg + "\nLeft Mouse: Fire\nRight Mouse: Change Weapon\nUp/Down Arrow: Zoom In/Out\nRight Key: Enable/disable heat vision\nLeft and Right Mouse: Restore all\nEscape: Leave Game"
endfunction

function DisplayInfoText takes player whichPlayer returns nothing
    if ( GetLocalPlayer() == whichPlayer ) then
        //call ClearTextMessages()
    endif
    //call DisplayTextToPlayer(whichPlayer, 0.0, 0.0, GetInfoText(whichPlayer))
endfunction

function ShowMultiboard takes player whichPlayer returns nothing
    if ( GetLocalPlayer() == whichPlayer ) then
        call MultiboardDisplay(udg_Multiboard, true)
    endif
endfunction

function HideMultiboard takes player whichPlayer returns nothing
    if ( GetLocalPlayer() == whichPlayer ) then
        call MultiboardDisplay(udg_Multiboard, false)
    endif
endfunction

function ShowUI takes player whichPlayer returns nothing
    if ( GetLocalPlayer() == whichPlayer ) then
        call ShowInterface(true, 0.0)
        call BlzHideCinematicPanels(false)
    endif
    if ( IsPlayerInForce(whichPlayer, udg_AirForce) ) then
        call ShowMultiboard(whichPlayer)
    else
        call HideMultiboard(whichPlayer)
    endif
endfunction

function HideUI takes player whichPlayer returns nothing
    if ( GetLocalPlayer() == whichPlayer ) then
        call ShowInterface(false, 0.0)
        call BlzHideCinematicPanels(true)
        call EnableUserControl(true)
    endif
    if ( IsPlayerInForce(whichPlayer, udg_AirForce) ) then
        call ShowMultiboard(whichPlayer)
    else
        call HideMultiboard(whichPlayer)
    endif
endfunction

function GetGunshipIcon takes player whichPlayer returns string
    return BlzGetAbilityIcon(GetUnitTypeId(udg_Gunship[GetConvertedPlayerId(whichPlayer)]))
endfunction

function UpdateGunship takes player whichPlayer returns nothing
    local integer playerId= GetPlayerId(whichPlayer)
    local integer convertedPlayerId= GetConvertedPlayerId(whichPlayer)
    local real x= cameraEyeX[playerId]
    local real y= cameraEyeY[playerId]
    local real z= cameraEyeZ[playerId]
    call SetUnitPosition(udg_Gunship[convertedPlayerId], x, y)
    call SetUnitFacing(udg_Gunship[convertedPlayerId], AngleBetweenCoordinatesDeg(x , y , cameraTargetX[playerId] , cameraTargetY[playerId]))
    call SetUnitFlyHeight(udg_Gunship[convertedPlayerId], z, 0.0)
    if ( not IsUnitSelected(udg_Gunship[convertedPlayerId], whichPlayer) ) then
        call SelectUnitForPlayerSingle(udg_Gunship[convertedPlayerId], whichPlayer)
    endif
endfunction

function OrderGunshipAttack takes player whichPlayer returns nothing
    local integer convertedPlayerId= GetConvertedPlayerId(whichPlayer)
    call IssuePointOrder(udg_Gunship[convertedPlayerId], "attackground", GetUnitX(udg_GunshipTarget[convertedPlayerId]), GetUnitY(udg_GunshipTarget[convertedPlayerId]))
endfunction

function UpdateGunshipTarget takes nothing returns nothing
    call SetUnitPosition(udg_GunshipTarget[GetConvertedPlayerId(GetTriggerPlayer())], BlzGetTriggerPlayerMouseX(), BlzGetTriggerPlayerMouseY())
endfunction

function ZoomIn takes player whichPlayer returns nothing
    local real dist= cameraDistance[GetPlayerId(whichPlayer)] - 100.0
    call SetCameraFieldForPlayer(whichPlayer, CAMERA_FIELD_TARGET_DISTANCE, RMaxBJ(600.0, dist), 0.2)
endfunction

function ZoomOut takes player whichPlayer returns nothing
    local real dist= cameraDistance[GetPlayerId(whichPlayer)] + 100.0
    call SetCameraFieldForPlayer(whichPlayer, CAMERA_FIELD_TARGET_DISTANCE, RMinBJ(4000.0, dist), 0.2)
endfunction


function Gunship___RegisterZoomEventsEnum takes nothing returns nothing
    call TriggerRegisterPlayerEvent(Gunship___zoomInTrigger, GetEnumPlayer(), EVENT_PLAYER_ARROW_UP_DOWN)
    call TriggerRegisterPlayerEvent(Gunship___zoomOutTrigger, GetEnumPlayer(), EVENT_PLAYER_ARROW_DOWN_DOWN)
    call BlzTriggerRegisterPlayerKeyEvent(Gunship___speedUpTrigger, GetEnumPlayer(), OSKEY_ADD, 0, true)
    call BlzTriggerRegisterPlayerKeyEvent(Gunship___speedDownTrigger, GetEnumPlayer(), OSKEY_SUBTRACT, 0, true)
    call BlzTriggerRegisterPlayerKeyEvent(Gunship___nightVisionTrigger, GetEnumPlayer(), OSKEY_SPACE, 0, true)
endfunction

function Gunship___TriggerActionZoomIn takes nothing returns nothing
    call ZoomIn(GetTriggerPlayer())
endfunction

function Gunship___TriggerActionZoomOut takes nothing returns nothing
    call ZoomOut(GetTriggerPlayer())
endfunction

function RotateCameraAround takes real degrees,real x,real y,player whichPlayer,real duration returns nothing
    if ( GetLocalPlayer() == whichPlayer ) then
        // Use only local code (no net traffic) within this block to avoid desyncs.
        call SetCameraRotateMode(x, y, bj_DEGTORAD * degrees, duration)
    endif
endfunction

function Gunship___TimerFunctionRotate takes nothing returns nothing
    local integer playerId= LoadInteger(Gunship___h, GetHandleId(GetExpiredTimer()), 0)
    local player whichPlayer= Player(playerId)
    local real duration= 20.0 - udg_GunshipSpeed[playerId + 1] * 0.01
    call SetCameraTargetControllerNoZForPlayer(whichPlayer, udg_Marker, 0, 0, false)
    call RotateCameraAround(360.0 , GetUnitX(udg_Marker) , GetUnitY(udg_Marker) , whichPlayer , duration)
    set whichPlayer=null
endfunction

function RotateCameraAroundTarget takes player whichPlayer returns nothing
    local integer playerId= GetPlayerId(whichPlayer)
    local real x= GetUnitX(udg_Marker)
    local real y= GetUnitY(udg_Marker)
    local real angle= AngleBetweenCoordinatesDeg(x , y , cameraEyeX[playerId] , cameraEyeY[playerId])
    local real remainingAngle= 360.0 - angle
    local real duration= 20.0 - udg_GunshipSpeed[GetConvertedPlayerId(whichPlayer)] * 0.01
    local real remainingAngleDuration= remainingAngle / 360.0 * duration
    call SetCameraTargetControllerNoZForPlayer(whichPlayer, udg_Marker, 0, 0, false)
    call RotateCameraAround(remainingAngle , x , y , whichPlayer , remainingAngleDuration)
    if ( Gunship___rotationTimer[playerId] == null ) then
        set Gunship___rotationTimer[playerId]=CreateTimer()
        call SaveInteger(Gunship___h, GetHandleId(Gunship___rotationTimer[playerId]), 0, playerId)
    endif
    call PauseTimer(Gunship___rotationTimer[playerId])
    call TimerStart(Gunship___rotationTimer[playerId], remainingAngleDuration - 1.0, true, function Gunship___TimerFunctionRotate)
endfunction

function Gunship___TriggerActionSpeedUp takes nothing returns nothing
    local integer convertedPlayerId= GetConvertedPlayerId(GetTriggerPlayer())
    if ( udg_GunshipSpeed[convertedPlayerId] < 190.0 ) then
        set udg_GunshipSpeed[convertedPlayerId]=udg_GunshipSpeed[convertedPlayerId] + 20.0
        set udg_GunshipSpeed[convertedPlayerId]=RMinBJ(190.0, udg_GunshipSpeed[convertedPlayerId])
        call RotateCameraAroundTarget(GetTriggerPlayer())
    endif
endfunction

function Gunship___TriggerActionSpeedDown takes nothing returns nothing
    local integer convertedPlayerId= GetConvertedPlayerId(GetTriggerPlayer())
    if ( udg_GunshipSpeed[convertedPlayerId] > 20.0 ) then
        set udg_GunshipSpeed[convertedPlayerId]=udg_GunshipSpeed[convertedPlayerId] - 20.0
        set udg_GunshipSpeed[convertedPlayerId]=RMaxBJ(20.0, udg_GunshipSpeed[convertedPlayerId])
        call RotateCameraAroundTarget(GetTriggerPlayer())
    endif
endfunction

function Gunship___NightVision takes player whichPlayer returns nothing
    local real red= 0.0
    local real green= 100.0
    local real blue= 0.0
    local real startTrans= 70.0
    local real endTrans= 70.0
    local real duration= 0.0
    if ( whichPlayer == GetLocalPlayer() ) then
        //call EnableUserUI(false)
        call SetCineFilterTexture("ReplaceableTextures\\CameraMasks\\White_mask.blp")
        call SetCineFilterBlendMode(BLEND_MODE_BLEND)
        call SetCineFilterTexMapFlags(TEXMAP_FLAG_NONE)
        call SetCineFilterStartUV(0, 0, 1, 1)
        call SetCineFilterEndUV(0, 0, 1, 1)
        call SetCineFilterStartColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - startTrans))
        call SetCineFilterEndColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - endTrans))
        call SetCineFilterDuration(duration)
        call DisplayCineFilter(true)
    endif
endfunction

function Gunship___NoNightVision takes player whichPlayer returns nothing
    if ( whichPlayer == GetLocalPlayer() ) then
        call DisplayCineFilter(false)
    endif
endfunction

function Gunship___TriggerActionNightVision takes nothing returns nothing
    local integer convertedPlayerId= GetConvertedPlayerId(GetTriggerPlayer())
    set udg_GunshipNightVision[convertedPlayerId]=not udg_GunshipNightVision[convertedPlayerId]
    if ( udg_GunshipNightVision[convertedPlayerId] ) then
        call Gunship___NightVision(GetTriggerPlayer())
    else
        call Gunship___NoNightVision(GetTriggerPlayer())
    endif
endfunction

function InitGunship takes nothing returns nothing
    call ForForce(udg_AirForce, function Gunship___RegisterZoomEventsEnum)
    call TriggerAddAction(Gunship___zoomInTrigger, function Gunship___TriggerActionZoomIn)
    call TriggerAddAction(Gunship___zoomOutTrigger, function Gunship___TriggerActionZoomOut)
    call TriggerAddAction(Gunship___speedUpTrigger, function Gunship___TriggerActionSpeedUp)
    call TriggerAddAction(Gunship___speedDownTrigger, function Gunship___TriggerActionSpeedDown)
    call TriggerAddAction(Gunship___nightVisionTrigger, function Gunship___TriggerActionNightVision)
endfunction


//library Gunship ends
//===========================================================================
// 
// Gunship 1.0
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Map Author: Barade
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************


function InitGlobals takes nothing returns nothing
    local integer i= 0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_GunshipFires[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ShowUI[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_GunshipDontMove[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_GunshipWeapon[i]=0
        set i=i + 1
    endloop

    set udg_GunshipWeaponTypesMax=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LeftMouseDown[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_RightMouseDown[i]=false
        set i=i + 1
    endloop

    set udg_AirForce=CreateForce()
    set udg_GroundForce=CreateForce()
    set udg_VictoryTimer=CreateTimer()
    set i=0
    loop
        exitwhen ( i > 2 )
        set udg_GunshipFireTimer[i]=CreateTimer()
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_QuitDialog[i]=DialogCreate()
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_GunshipNightVision[i]=false
        set i=i + 1
    endloop

    set udg_TmpString=""
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_GunshipSpeed[i]=0
        set i=i + 1
    endloop

    set udg_MultiboardRow=0
endfunction

//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//***************************************************************************
//*  SoundUtils




//***************************************************************************
//*  Stack




//***************************************************************************
//*  TimerUtils




//***************************************************************************
//*  MySoundsVariables


// scope MySoundsVariables begins



function MySoundsVariables_init takes nothing returns nothing
    set SOUND_MACHINEGUN=(s__SoundUtils___soundhelper_create((("Units\\Human\\GyroCopter\\GyrocopterImpactHit1.wav" ) ) , ( ( 750 ) ) , ( ( false ) ) , ( ( true) ) , ( true ) , ( 10 ) , ( 10 ) , ( "CombatSoundsEAX"))) // INLINED!!
    //During the map loading, the sound will be initialized ; do not forget that the twin slash is compulsory for the path of an object in Jass (contrary to GUI, where 1 slash is enough).
    //To sum up, you will get something like this
    //Set the  SOUND_MACHINEGUN  to be a Define Sound (blabla)
    //DefineSound wants the parameters : 
    //Custom Path of the sound 
    //Sound duration in miliseconds
    //Sound to play a loop yes/no  =>for you, never, the sound will be played one time per attack
    // 3D Sound yes/ no : for you, it will be yes : the sound will be played for a player only if the camera is over the turret.
    //To translate set SOUND_MACHINEGUN = DefineSound("Units\Human\GyroCopter\GyrocopterImpactHit1.wav",750, false, true)
    //it is: set  SOUND_MACHINEGUN  like a define sound to play the file path "Units\Human\GyroCopter\GyrocopterImpactHit1.wav" during 750 miliseconds, not in loop, in 3D.
    // You create as much different sounds as you want, but you have to set them like our example.
endfunction
// scope MySoundsVariables ends


//***************************************************************************
//*  Barades Math Utils
//***************************************************************************
//*  Barades String Utils
//***************************************************************************
//*  CameraPosSync
//***************************************************************************
//*  Gunship

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateBuildingsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_n001_0096=BlzCreateUnitWithSkin(p, 'n001', - 704.0, - 832.0, 270.000, 'n001')
endfunction

//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_H000_0004=BlzCreateUnitWithSkin(p, 'H000', - 582.5, - 951.8, 90.000, 'H000')
endfunction

//===========================================================================
function CreateBuildingsForPlayer1 takes nothing returns nothing
    local player p= Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_n001_0098=BlzCreateUnitWithSkin(p, 'n001', - 320.0, - 832.0, 270.000, 'n001')
endfunction

//===========================================================================
function CreateUnitsForPlayer1 takes nothing returns nothing
    local player p= Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_H000_0097=BlzCreateUnitWithSkin(p, 'H000', - 418.8, - 974.8, 90.000, 'H000')
endfunction

//===========================================================================
function CreateBuildingsForPlayer2 takes nothing returns nothing
    local player p= Player(2)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'hcas', - 1408.0, 384.0, 270.000, 'hcas')
endfunction

//===========================================================================
function CreateUnitsForPlayer2 takes nothing returns nothing
    local player p= Player(2)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'zcso', - 1505.8, 69.1, 264.340, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'hpea', - 1543.0, 641.9, 185.092, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', - 1448.0, 633.8, 0.582, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', - 1254.0, 662.3, 349.727, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', - 1629.0, 637.8, 113.679, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', - 1336.0, 658.2, 28.587, 'hpea')
    set gg_unit_H003_0112=BlzCreateUnitWithSkin(p, 'H003', - 1650.6, 73.8, 270.000, 'H003')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 1404.8, 65.6, 264.340, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 1303.7, 58.5, 264.340, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 1224.7, 58.6, 264.340, 'zcso')
endfunction

//===========================================================================
function CreateBuildingsForPlayer3 takes nothing returns nothing
    local player p= Player(3)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'hcas', 0.0, 384.0, 270.000, 'hcas')
endfunction

//===========================================================================
function CreateUnitsForPlayer3 takes nothing returns nothing
    local player p= Player(3)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'hpea', - 199.6, 676.4, 284.917, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', - 60.7, 693.2, 46.276, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', 232.3, 323.5, 177.160, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', 86.1, 659.6, 130.236, 'hpea')
    set u=BlzCreateUnitWithSkin(p, 'hpea', 230.7, 678.8, 300.749, 'hpea')
    set gg_unit_H003_0111=BlzCreateUnitWithSkin(p, 'H003', - 320.8, 279.9, 270.000, 'H003')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 47.1, 66.6, 264.340, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 54.0, 63.1, 264.340, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 155.1, 56.0, 264.340, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 234.1, 56.1, 264.340, 'zcso')
endfunction

//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'nfsp', 1730.3, - 1495.1, 170.447, 'nfsp')
    set u=BlzCreateUnitWithSkin(p, 'nftr', 1625.4, - 1378.2, 110.855, 'nftr')
    set u=BlzCreateUnitWithSkin(p, 'nftr', 1825.1, - 1370.6, 291.619, 'nftr')
    set u=BlzCreateUnitWithSkin(p, 'nftt', 1823.7, - 1454.0, 84.674, 'nftt')
    set u=BlzCreateUnitWithSkin(p, 'nftb', 1787.5, - 1629.9, 26.632, 'nftb')
    set u=BlzCreateUnitWithSkin(p, 'nmrr', - 2376.0, - 2976.3, 246.178, 'nmrr')
    set u=BlzCreateUnitWithSkin(p, 'nmrl', - 2305.7, - 3116.1, 192.366, 'nmrl')
    set u=BlzCreateUnitWithSkin(p, 'nmrm', - 2441.0, - 3095.2, 30.411, 'nmrm')
endfunction

//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_n000_0003=BlzCreateUnitWithSkin(p, 'n000', - 512.0, - 1024.0, 270.000, 'n000')
    set u=BlzCreateUnitWithSkin(p, 'ncbe', - 448.0, - 416.0, 270.000, 'ncbe')
    set u=BlzCreateUnitWithSkin(p, 'ncb4', - 288.0, - 2208.0, 270.000, 'ncb4')
    set u=BlzCreateUnitWithSkin(p, 'ncb5', 224.0, - 1504.0, 270.000, 'ncb5')
    set u=BlzCreateUnitWithSkin(p, 'ncb6', 160.0, - 2016.0, 270.000, 'ncb6')
    set u=BlzCreateUnitWithSkin(p, 'ngol', - 1408.0, 896.0, 270.000, 'ngol')
    call SetResourceAmount(u, 12500)
    set u=BlzCreateUnitWithSkin(p, 'ngol', 64.0, 896.0, 270.000, 'ngol')
    call SetResourceAmount(u, 12500)
    set u=BlzCreateUnitWithSkin(p, 'nfoh', 1728.0, - 1088.0, 270.000, 'nfoh')
    set u=BlzCreateUnitWithSkin(p, 'nmoo', - 2944.0, 192.0, 270.000, 'nmoo')
    set u=BlzCreateUnitWithSkin(p, 'ngad', - 3072.0, - 2432.0, 270.000, 'ngad')
    set u=BlzCreateUnitWithSkin(p, 'nmer', - 3072.0, - 2048.0, 270.000, 'nmer')
    call SetUnitColor(u, ConvertPlayerColor(0))
    set u=BlzCreateUnitWithSkin(p, 'ngme', - 3136.0, - 1600.0, 270.000, 'ngme')
endfunction

//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 127.5, - 1844.4, 86.564, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 284.8, - 1734.0, 346.003, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 269.6, - 1635.6, 23.325, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 167.9, - 1619.1, 207.714, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 30.9, - 1633.5, 202.012, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 721.1, - 1574.8, 103.813, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 695.1, - 1779.8, 222.337, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 725.8, - 1960.1, 212.768, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 864.0, - 1939.1, 61.624, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 862.7, - 1672.8, 25.083, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 776.4, - 1689.3, 99.715, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 800.2, - 1844.9, 135.147, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 658.0, - 1669.5, 42.079, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 583.3, - 1495.9, 190.146, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 582.0, - 1939.5, 203.956, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 566.6, - 2075.9, 342.180, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvlw', - 630.9, - 1843.2, 9.460, 'nvlw')
    set u=BlzCreateUnitWithSkin(p, 'nvlw', - 778.7, - 1483.6, 354.265, 'nvlw')
    set u=BlzCreateUnitWithSkin(p, 'nvlw', - 953.2, - 1778.5, 313.461, 'nvlw')
    set u=BlzCreateUnitWithSkin(p, 'nvlw', - 948.3, - 1824.1, 309.912, 'nvlw')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 491.8, - 1470.7, 304.605, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 569.3, - 1580.7, 145.837, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 438.5, - 2017.6, 326.930, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 688.5, - 2024.7, 332.138, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 838.8, - 2052.2, 253.583, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 59.5, - 1495.0, 299.474, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 342.8, - 1461.7, 345.772, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 390.7, - 1372.4, 39.420, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 436.5, - 1348.9, 329.611, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 503.6, - 1334.7, 330.072, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvlk', - 601.4, - 1351.3, 246.684, 'nvlk')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 189.4, - 1859.1, 197.848, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 292.1, - 1859.1, 84.806, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 406.7, - 1842.5, 119.315, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 443.0, - 1831.4, 252.572, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvk2', - 488.9, - 1805.1, 126.467, 'nvk2')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 189.3, - 1682.4, 54.736, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 118.2, - 1696.4, 179.984, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 64.4, - 1743.8, 185.290, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 32.9, - 1778.5, 292.168, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 47.9, - 2003.9, 97.759, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 103.5, - 1536.5, 259.362, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 144.2, - 1503.8, 53.175, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 200.6, - 1516.9, 297.881, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 711.3, - 1510.4, 56.856, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 896.1, - 1503.8, 296.772, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 939.8, - 1543.0, 177.435, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 1002.8, - 1631.5, 280.566, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 1050.6, - 1666.2, 8.855, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvil', - 1080.5, - 1696.4, 152.396, 'nvil')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 167.6, - 1658.1, 181.302, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 313.5, - 1623.2, 256.297, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 428.0, - 1728.1, 207.483, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 554.5, - 1818.3, 99.297, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 286.5, - 1916.9, 200.891, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 435.7, - 1943.4, 241.794, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 828.8, - 1895.5, 15.151, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 941.9, - 1886.4, 344.267, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 973.2, - 1916.9, 58.251, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 984.7, - 1974.8, 113.316, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 966.0, - 2037.5, 296.574, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 916.1, - 2081.9, 318.251, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', 30.8, - 1560.1, 194.145, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 541.7, - 1377.1, 58.350, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 670.9, - 1370.1, 166.228, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 705.9, - 1391.0, 255.561, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 732.8, - 1363.0, 77.709, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'nvl2', - 71.4, - 1360.7, 334.621, 'nvl2')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 566.8, - 1269.0, 359.396, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 396.2, - 1282.1, 86.597, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 1128.3, - 1530.0, 28.785, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 1234.8, - 1579.5, 232.906, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 31.8, - 1297.3, 297.013, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 77.0, - 1158.7, 199.595, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 112.4, - 1964.4, 337.269, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 755.2, - 2128.4, 66.656, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 961.9, - 2179.9, 122.864, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 928.1, - 1688.1, 119.249, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 473.5, - 1706.6, 17.260, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 422.2, - 1599.7, 7.372, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 560.0, - 1698.4, 244.168, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 814.1, - 1601.8, 252.770, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', - 45.9, - 2158.5, 54.054, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 261.8, - 1753.7, 151.385, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 140.1, - 1168.4, 80.642, 'zcso')
    set u=BlzCreateUnitWithSkin(p, 'zcso', 9.6, - 1102.9, 58.196, 'zcso')
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer0()
    call CreateBuildingsForPlayer1()
    call CreateBuildingsForPlayer2()
    call CreateBuildingsForPlayer3()
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer1()
    call CreateUnitsForPlayer2()
    call CreateUnitsForPlayer3()
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings()
    call CreatePlayerBuildings()
    call CreateNeutralHostile()
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Initialization
//===========================================================================
function Trig_Initialization_Actions takes nothing returns nothing
    call MeleeStartingVisibility()
    call FogEnableOff()
    call FogMaskEnableOff()
    call SetTimeOfDay(0.00)
    call UseTimeOfDayBJ(false)
    call ForceAddPlayerSimple(Player(0), udg_AirForce)
    call ForceAddPlayerSimple(Player(1), udg_AirForce)
    call ForceAddPlayerSimple(Player(2), udg_GroundForce)
    call ForceAddPlayerSimple(Player(3), udg_GroundForce)
    set udg_Marker=gg_unit_n000_0003
    set udg_Gunship[1]=gg_unit_H000_0004
    set udg_Gunship[2]=gg_unit_H000_0097
    set udg_GunshipTarget[1]=gg_unit_n001_0096
    set udg_GunshipTarget[2]=gg_unit_n001_0098
    set udg_GunshipSpeed[1]=100.00
    set udg_GunshipSpeed[2]=100.00
    set udg_GunshipWeaponTypes[0]='H000'
    set udg_GunshipWeaponTypes[1]='H001'
    set udg_GunshipWeaponTypes[2]='H002'
    set udg_GunshipWeaponTypes[3]='H004'
    set udg_GunshipWeaponTypesMax=3
    call InitGunship()
endfunction

//===========================================================================
function InitTrig_Initialization takes nothing returns nothing
    set gg_trg_Initialization=CreateTrigger()
    call TriggerAddAction(gg_trg_Initialization, function Trig_Initialization_Actions)
endfunction

//===========================================================================
// Trigger: Start
//===========================================================================
function Trig_Start_Func001Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(GetEnumPlayer()) != PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Start_Func001A takes nothing returns nothing
    if ( Trig_Start_Func001Func001C() ) then
        call RemoveUnit(udg_Gunship[GetConvertedPlayerId(GetEnumPlayer())])
        call RemoveUnit(udg_GunshipTarget[GetConvertedPlayerId(GetEnumPlayer())])
    else
        call SelectUnitForPlayerSingle(udg_Gunship[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer())
        call SetCameraFieldForPlayer(GetEnumPlayer(), CAMERA_FIELD_TARGET_DISTANCE, 4000.00, 0)
        call SetCameraFieldForPlayer(GetEnumPlayer(), CAMERA_FIELD_FARZ, 15000.00, 0)
        call SetCameraFieldForPlayer(GetEnumPlayer(), CAMERA_FIELD_FIELD_OF_VIEW, 200.00, 0)
        set udg_ShowUI[GetConvertedPlayerId(GetEnumPlayer())]=true
    endif
endfunction

function Trig_Start_Func004Func001Func004A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Start_Func004Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(GetEnumPlayer()) != PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Start_Func004A takes nothing returns nothing
    if ( Trig_Start_Func004Func001C() ) then
        set bj_wantDestroyGroup=true
        call ForGroupBJ(GetUnitsOfPlayerAll(GetEnumPlayer()), function Trig_Start_Func004Func001Func004A)
    else
        call SetPlayerStateBJ(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD, 750)
        call SetPlayerStateBJ(GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 750)
    endif
endfunction

function Trig_Start_Func014A takes nothing returns nothing
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), GetConvertedPlayerId(GetEnumPlayer()), udg_MultiboardRow, true, true)
endfunction

function Trig_Start_Func051A takes nothing returns nothing
    call ShowMultiboard(GetEnumPlayer())
    call RotateCameraAroundTarget(GetEnumPlayer())
endfunction

function Trig_Start_Actions takes nothing returns nothing
    call ForForce(udg_AirForce, function Trig_Start_Func001A)
    call SelectUnitForPlayerSingle(gg_unit_H003_0112, Player(2))
    call SelectUnitForPlayerSingle(gg_unit_H003_0111, Player(3))
    call ForForce(udg_GroundForce, function Trig_Start_Func004A)
    call ShowUnitHide(udg_Marker)
    call DisplayTextToForce(udg_AirForce, "TRIGSTR_081")
    call DisplayTextToForce(udg_GroundForce, "TRIGSTR_034")
    call StartTimerBJ(udg_VictoryTimer, false, 360.00)
    call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "TRIGSTR_031")
    call CreateMultiboardBJ(CountPlayersInForceBJ(udg_AirForce), 7, "TRIGSTR_052")
    set udg_Multiboard=GetLastCreatedMultiboard()
    call MultiboardSetItemWidthBJ(GetLastCreatedMultiboard(), 0, 0, 12.00)
    set udg_MultiboardRow=1
    call ForForce(udg_AirForce, function Trig_Start_Func014A)
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_072")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_055")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, "TRIGSTR_057")
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_056")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, "TRIGSTR_058")
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_068")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, "TRIGSTR_069")
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_078")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, "TRIGSTR_079")
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_070")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, "TRIGSTR_071")
    set udg_MultiboardRow=( udg_MultiboardRow + 1 )
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 1, udg_MultiboardRow, "TRIGSTR_075")
    call MultiboardSetItemStyleBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, true, false)
    call MultiboardSetItemValueBJ(GetLastCreatedMultiboard(), 2, udg_MultiboardRow, "TRIGSTR_076")
    call MultiboardMinimizeBJ(false, GetLastCreatedMultiboard())
    call MultiboardDisplayBJ(false, GetLastCreatedMultiboard())
    call ForForce(udg_AirForce, function Trig_Start_Func051A)
endfunction

//===========================================================================
function InitTrig_Start takes nothing returns nothing
    set gg_trg_Start=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Start, 0.00)
    call TriggerAddAction(gg_trg_Start, function Trig_Start_Actions)
endfunction

//===========================================================================
// Trigger: Update Gunships
//===========================================================================
function Trig_Update_Gunships_Func001Func001Func004Func002Func004C takes nothing returns boolean
    if ( ( udg_GunshipWeapon[GetConvertedPlayerId(GetEnumPlayer())] != 1 ) ) then
        return true
    endif
    if ( ( TimerGetElapsed(udg_GunshipFireTimer[GetConvertedPlayerId(GetEnumPlayer())]) >= 2.00 ) ) then
        return true
    endif
    return false
endfunction

function Trig_Update_Gunships_Func001Func001Func004Func002Func006C takes nothing returns boolean
    if ( not ( udg_GunshipWeapon[GetConvertedPlayerId(GetEnumPlayer())] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Update_Gunships_Func001Func001Func004Func002C takes nothing returns boolean
    if ( not ( udg_GunshipFires[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    if ( not Trig_Update_Gunships_Func001Func001Func004Func002Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_Update_Gunships_Func001Func001Func004C takes nothing returns boolean
    if ( not ( udg_GunshipDontMove[GetConvertedPlayerId(GetEnumPlayer())] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Update_Gunships_Func001Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Update_Gunships_Func001A takes nothing returns nothing
    if ( Trig_Update_Gunships_Func001Func001C() ) then
        call DisplayInfoText(GetEnumPlayer())
        if ( Trig_Update_Gunships_Func001Func001Func004C() ) then
            call UpdateGunship(GetEnumPlayer())
            if ( Trig_Update_Gunships_Func001Func001Func004Func002C() ) then
                set udg_GunshipDontMove[GetConvertedPlayerId(GetEnumPlayer())]=true
                call OrderGunshipAttack(GetEnumPlayer())
                if ( Trig_Update_Gunships_Func001Func001Func004Func002Func006C() ) then
                    call RunSoundOnUnit(SOUND_MACHINEGUN , udg_Gunship[GetConvertedPlayerId(GetEnumPlayer())])
                else
                    call DoNothing()
                endif
            else
                call DoNothing()
            endif
        else
            call DoNothing()
        endif
    else
        call DoNothing()
    endif
endfunction

function Trig_Update_Gunships_Actions takes nothing returns nothing
    call ForForce(udg_AirForce, function Trig_Update_Gunships_Func001A)
endfunction

//===========================================================================
function InitTrig_Update_Gunships takes nothing returns nothing
    set gg_trg_Update_Gunships=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Update_Gunships, 0.50)
    call TriggerAddAction(gg_trg_Update_Gunships, function Trig_Update_Gunships_Actions)
endfunction

//===========================================================================
// Trigger: Update Multiboards
//===========================================================================
function Trig_Update_Multiboards_Func001Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Update_Multiboards_Func001A takes nothing returns nothing
    if ( Trig_Update_Multiboards_Func001Func001C() ) then
        call MultiboardSetItemValueBJ(udg_Multiboard, GetConvertedPlayerId(GetEnumPlayer()), 1, GetUnitName(udg_Gunship[GetConvertedPlayerId(GetEnumPlayer())]))
        set udg_TmpString=(BlzGetAbilityIcon(GetUnitTypeId(udg_Gunship[GetConvertedPlayerId((GetEnumPlayer()))]))) // INLINED!!
        call MultiboardSetItemIconBJ(udg_Multiboard, GetConvertedPlayerId(GetEnumPlayer()), 1, udg_TmpString)
        call MultiboardSetItemValueBJ(udg_Multiboard, GetConvertedPlayerId(GetEnumPlayer()), 2, R2SW(udg_GunshipSpeed[GetConvertedPlayerId(GetEnumPlayer())], 1, 2))
    else
        call MultiboardSetItemValueBJ(udg_Multiboard, GetConvertedPlayerId(GetEnumPlayer()), 1, "TRIGSTR_064")
        call MultiboardSetItemIconBJ(udg_Multiboard, GetConvertedPlayerId(GetEnumPlayer()), 1, "ReplaceableTextures\\WorldEditUI\\Editor-Random-Unit.blp")
        call MultiboardSetItemValueBJ(udg_Multiboard, GetConvertedPlayerId(GetEnumPlayer()), 2, "TRIGSTR_074")
    endif
endfunction

function Trig_Update_Multiboards_Actions takes nothing returns nothing
    call ForForce(udg_AirForce, function Trig_Update_Multiboards_Func001A)
endfunction

//===========================================================================
function InitTrig_Update_Multiboards takes nothing returns nothing
    set gg_trg_Update_Multiboards=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Update_Multiboards, 0.00)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Update_Multiboards, 1.00)
    call TriggerAddAction(gg_trg_Update_Multiboards, function Trig_Update_Multiboards_Actions)
endfunction

//===========================================================================
// Trigger: Fire End
//===========================================================================
function Trig_Fire_End_Conditions takes nothing returns boolean
    if ( not ( GetTriggerUnit() == udg_Gunship[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] ) ) then
        return false
    endif
    if ( not ( GetIssuedOrderIdBJ() == String2OrderIdBJ("attackground") ) ) then
        return false
    endif
    return true
endfunction

function Trig_Fire_End_Actions takes nothing returns nothing
    call PolledWait(0.70)
    set udg_GunshipDontMove[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=false
endfunction

//===========================================================================
function InitTrig_Fire_End takes nothing returns nothing
    set gg_trg_Fire_End=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Fire_End, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddCondition(gg_trg_Fire_End, Condition(function Trig_Fire_End_Conditions))
    call TriggerAddAction(gg_trg_Fire_End, function Trig_Fire_End_Actions)
endfunction

//===========================================================================
// Trigger: Fire Mouse Down
//===========================================================================
function Trig_Fire_Mouse_Down_Conditions takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_LEFT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Fire_Mouse_Down_Actions takes nothing returns nothing
    set udg_GunshipFires[GetConvertedPlayerId(GetTriggerPlayer())]=true
    call StartTimerBJ(udg_GunshipFireTimer[GetConvertedPlayerId(GetTriggerPlayer())], false, 200.00)
endfunction

//===========================================================================
function InitTrig_Fire_Mouse_Down takes nothing returns nothing
    set gg_trg_Fire_Mouse_Down=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Fire_Mouse_Down, Player(0), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Fire_Mouse_Down, Player(1), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerAddCondition(gg_trg_Fire_Mouse_Down, Condition(function Trig_Fire_Mouse_Down_Conditions))
    call TriggerAddAction(gg_trg_Fire_Mouse_Down, function Trig_Fire_Mouse_Down_Actions)
endfunction

//===========================================================================
// Trigger: Fire Mouse Up
//===========================================================================
function Trig_Fire_Mouse_Up_Conditions takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_LEFT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Fire_Mouse_Up_Actions takes nothing returns nothing
    set udg_GunshipFires[GetConvertedPlayerId(GetTriggerPlayer())]=false
    call PauseTimerBJ(true, udg_GunshipFireTimer[GetConvertedPlayerId(GetTriggerPlayer())])
endfunction

//===========================================================================
function InitTrig_Fire_Mouse_Up takes nothing returns nothing
    set gg_trg_Fire_Mouse_Up=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Fire_Mouse_Up, Player(0), bj_MOUSEEVENTTYPE_UP)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Fire_Mouse_Up, Player(1), bj_MOUSEEVENTTYPE_UP)
    call TriggerAddCondition(gg_trg_Fire_Mouse_Up, Condition(function Trig_Fire_Mouse_Up_Conditions))
    call TriggerAddAction(gg_trg_Fire_Mouse_Up, function Trig_Fire_Mouse_Up_Actions)
endfunction

//===========================================================================
// Trigger: Change Weapon
//===========================================================================
function Trig_Change_Weapon_Conditions takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Change_Weapon_Func002C takes nothing returns boolean
    if ( not ( udg_GunshipWeapon[GetConvertedPlayerId(GetTriggerPlayer())] == udg_GunshipWeaponTypesMax ) ) then
        return false
    endif
    return true
endfunction

function Trig_Change_Weapon_Actions takes nothing returns nothing
    if ( Trig_Change_Weapon_Func002C() ) then
        set udg_GunshipWeapon[GetConvertedPlayerId(GetTriggerPlayer())]=0
    else
        set udg_GunshipWeapon[GetConvertedPlayerId(GetTriggerPlayer())]=( udg_GunshipWeapon[GetConvertedPlayerId(GetTriggerPlayer())] + 1 )
    endif
    call ReplaceUnitBJ(udg_Gunship[GetConvertedPlayerId(GetTriggerPlayer())], udg_GunshipWeaponTypes[udg_GunshipWeapon[GetConvertedPlayerId(GetTriggerPlayer())]], bj_UNIT_STATE_METHOD_RELATIVE)
    set udg_Gunship[GetConvertedPlayerId(GetTriggerPlayer())]=GetLastReplacedUnitBJ()
    call SelectUnitForPlayerSingle(udg_Gunship[GetConvertedPlayerId(GetTriggerPlayer())], GetTriggerPlayer())
    set udg_GunshipDontMove[GetConvertedPlayerId(GetTriggerPlayer())]=false
endfunction

//===========================================================================
function InitTrig_Change_Weapon takes nothing returns nothing
    set gg_trg_Change_Weapon=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Change_Weapon, Player(0), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Change_Weapon, Player(1), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerAddCondition(gg_trg_Change_Weapon, Condition(function Trig_Change_Weapon_Conditions))
    call TriggerAddAction(gg_trg_Change_Weapon, function Trig_Change_Weapon_Actions)
endfunction

//===========================================================================
// Trigger: Mouse Down
//===========================================================================
function Trig_Mouse_Down_Func001C takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_LEFT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mouse_Down_Func002C takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mouse_Down_Actions takes nothing returns nothing
    if ( Trig_Mouse_Down_Func001C() ) then
        set udg_LeftMouseDown[GetConvertedPlayerId(GetTriggerPlayer())]=true
    else
        call DoNothing()
    endif
    if ( Trig_Mouse_Down_Func002C() ) then
        set udg_RightMouseDown[GetConvertedPlayerId(GetTriggerPlayer())]=true
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Mouse_Down takes nothing returns nothing
    set gg_trg_Mouse_Down=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Mouse_Down, Player(0), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Mouse_Down, Player(1), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerAddAction(gg_trg_Mouse_Down, function Trig_Mouse_Down_Actions)
endfunction

//===========================================================================
// Trigger: Mouse Up
//===========================================================================
function Trig_Mouse_Up_Func001C takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_LEFT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mouse_Up_Func002C takes nothing returns boolean
    if ( not ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mouse_Up_Actions takes nothing returns nothing
    if ( Trig_Mouse_Up_Func001C() ) then
        set udg_LeftMouseDown[GetConvertedPlayerId(GetTriggerPlayer())]=false
    else
        call DoNothing()
    endif
    if ( Trig_Mouse_Up_Func002C() ) then
        set udg_RightMouseDown[GetConvertedPlayerId(GetTriggerPlayer())]=false
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Mouse_Up takes nothing returns nothing
    set gg_trg_Mouse_Up=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Mouse_Up, Player(0), bj_MOUSEEVENTTYPE_UP)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Mouse_Up, Player(1), bj_MOUSEEVENTTYPE_UP)
    call TriggerAddAction(gg_trg_Mouse_Up, function Trig_Mouse_Up_Actions)
endfunction

//===========================================================================
// Trigger: Restore
//===========================================================================
function Trig_Restore_Func001C takes nothing returns boolean
    if ( ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_LEFT ) ) then
        return true
    endif
    if ( ( BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT ) ) then
        return true
    endif
    return false
endfunction

function Trig_Restore_Conditions takes nothing returns boolean
    if ( not Trig_Restore_Func001C() ) then
        return false
    endif
    if ( not ( udg_LeftMouseDown[GetConvertedPlayerId(GetTriggerPlayer())] == true ) ) then
        return false
    endif
    if ( not ( udg_RightMouseDown[GetConvertedPlayerId(GetTriggerPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Restore_Func004A takes nothing returns nothing
    call SetUnitLifePercentBJ(GetEnumUnit(), 100)
    call SetUnitManaPercentBJ(GetEnumUnit(), 100)
endfunction

function Trig_Restore_Func005A takes nothing returns nothing
    call DestructableRestoreLife(GetEnumDestructable(), GetDestructableMaxLife(GetEnumDestructable()), true)
endfunction

function Trig_Restore_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), function Trig_Restore_Func004A)
    call EnumDestructablesInRectAll(GetPlayableMapRect(), function Trig_Restore_Func005A)
endfunction

//===========================================================================
function InitTrig_Restore takes nothing returns nothing
    set gg_trg_Restore=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Restore, Player(0), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Restore, Player(1), bj_MOUSEEVENTTYPE_DOWN)
    call TriggerAddCondition(gg_trg_Restore, Condition(function Trig_Restore_Conditions))
    call TriggerAddAction(gg_trg_Restore, function Trig_Restore_Actions)
endfunction

//===========================================================================
// Trigger: Escape UI
//===========================================================================
function Trig_Escape_UI_Func001C takes nothing returns boolean
    if ( not ( udg_ShowUI[GetConvertedPlayerId(GetTriggerPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Escape_UI_Actions takes nothing returns nothing
    if ( Trig_Escape_UI_Func001C() ) then
        set udg_ShowUI[GetConvertedPlayerId(GetTriggerPlayer())]=false
        call HideUI(GetTriggerPlayer())
    else
        set udg_ShowUI[GetConvertedPlayerId(GetTriggerPlayer())]=true
        call ShowUI(GetTriggerPlayer())
    endif
endfunction

//===========================================================================
function InitTrig_Escape_UI takes nothing returns nothing
    set gg_trg_Escape_UI=CreateTrigger()
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Escape_UI, Player(0))
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Escape_UI, Player(1))
    call TriggerAddAction(gg_trg_Escape_UI, function Trig_Escape_UI_Actions)
endfunction

//===========================================================================
// Trigger: Change Target
//===========================================================================
function Trig_Change_Target_Actions takes nothing returns nothing
    call SetUnitPosition(udg_GunshipTarget[GetConvertedPlayerId(GetTriggerPlayer())], BlzGetTriggerPlayerMouseX(), BlzGetTriggerPlayerMouseY()) // INLINED!!
endfunction

//===========================================================================
function InitTrig_Change_Target takes nothing returns nothing
    set gg_trg_Change_Target=CreateTrigger()
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Change_Target, Player(0), bj_MOUSEEVENTTYPE_MOVE)
    call TriggerRegisterPlayerMouseEventBJ(gg_trg_Change_Target, Player(1), bj_MOUSEEVENTTYPE_MOVE)
    call TriggerAddAction(gg_trg_Change_Target, function Trig_Change_Target_Actions)
endfunction

//===========================================================================
// Trigger: Victory Air Force
//===========================================================================
function Trig_Victory_Air_Force_Func001C takes nothing returns boolean
    if ( ( IsPlayerInForce(GetOwningPlayer(GetTriggerUnit()), udg_GroundForce) == true ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetTriggerUnit()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetTriggerUnit()) == Player(PLAYER_NEUTRAL_PASSIVE) ) ) then
        return true
    endif
    return false
endfunction

function Trig_Victory_Air_Force_Conditions takes nothing returns boolean
    if ( not Trig_Victory_Air_Force_Func001C() ) then
        return false
    endif
    if ( not ( GetPlayerUnitCount(Player(2), false) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerUnitCount(Player(3), false) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerUnitCount(Player(PLAYER_NEUTRAL_AGGRESSIVE), false) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerUnitCount(Player(PLAYER_NEUTRAL_PASSIVE), false) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Victory_Air_Force_Func002A takes nothing returns nothing
    call CustomDefeatBJ(GetEnumPlayer(), "TRIGSTR_027")
endfunction

function Trig_Victory_Air_Force_Func003A takes nothing returns nothing
    call CustomVictoryBJ(GetEnumPlayer(), true, true)
endfunction

function Trig_Victory_Air_Force_Actions takes nothing returns nothing
    call ForForce(udg_GroundForce, function Trig_Victory_Air_Force_Func002A)
    call ForForce(udg_AirForce, function Trig_Victory_Air_Force_Func003A)
endfunction

//===========================================================================
function InitTrig_Victory_Air_Force takes nothing returns nothing
    set gg_trg_Victory_Air_Force=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Victory_Air_Force, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Victory_Air_Force, Condition(function Trig_Victory_Air_Force_Conditions))
    call TriggerAddAction(gg_trg_Victory_Air_Force, function Trig_Victory_Air_Force_Actions)
endfunction

//===========================================================================
// Trigger: Victory Ground Force Kill
//===========================================================================
function Trig_Victory_Ground_Force_Kill_Conditions takes nothing returns boolean
    if ( not ( IsPlayerInForce(GetOwningPlayer(GetTriggerUnit()), udg_AirForce) == true ) ) then
        return false
    endif
    if ( not ( GetPlayerUnitCount(Player(0), false) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerUnitCount(Player(1), false) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Victory_Ground_Force_Kill_Func002A takes nothing returns nothing
    call CustomDefeatBJ(GetEnumPlayer(), "TRIGSTR_080")
endfunction

function Trig_Victory_Ground_Force_Kill_Func003A takes nothing returns nothing
    call CustomVictoryBJ(GetEnumPlayer(), true, true)
endfunction

function Trig_Victory_Ground_Force_Kill_Actions takes nothing returns nothing
    call ForForce(udg_AirForce, function Trig_Victory_Ground_Force_Kill_Func002A)
    call ForForce(udg_GroundForce, function Trig_Victory_Ground_Force_Kill_Func003A)
endfunction

//===========================================================================
function InitTrig_Victory_Ground_Force_Kill takes nothing returns nothing
    set gg_trg_Victory_Ground_Force_Kill=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Victory_Ground_Force_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Victory_Ground_Force_Kill, Condition(function Trig_Victory_Ground_Force_Kill_Conditions))
    call TriggerAddAction(gg_trg_Victory_Ground_Force_Kill, function Trig_Victory_Ground_Force_Kill_Actions)
endfunction

//===========================================================================
// Trigger: Victory Ground Force Time
//===========================================================================
function Trig_Victory_Ground_Force_Time_Func001A takes nothing returns nothing
    call CustomDefeatBJ(GetEnumPlayer(), "TRIGSTR_030")
endfunction

function Trig_Victory_Ground_Force_Time_Func002A takes nothing returns nothing
    call CustomVictoryBJ(GetEnumPlayer(), true, true)
endfunction

function Trig_Victory_Ground_Force_Time_Actions takes nothing returns nothing
    call ForForce(udg_AirForce, function Trig_Victory_Ground_Force_Time_Func001A)
    call ForForce(udg_GroundForce, function Trig_Victory_Ground_Force_Time_Func002A)
endfunction

//===========================================================================
function InitTrig_Victory_Ground_Force_Time takes nothing returns nothing
    set gg_trg_Victory_Ground_Force_Time=CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Victory_Ground_Force_Time, udg_VictoryTimer)
    call TriggerAddAction(gg_trg_Victory_Ground_Force_Time, function Trig_Victory_Ground_Force_Time_Actions)
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Initialization()
    call InitTrig_Start()
    call InitTrig_Update_Gunships()
    call InitTrig_Update_Multiboards()
    call InitTrig_Fire_End()
    call InitTrig_Fire_Mouse_Down()
    call InitTrig_Fire_Mouse_Up()
    call InitTrig_Change_Weapon()
    call InitTrig_Mouse_Down()
    call InitTrig_Mouse_Up()
    call InitTrig_Restore()
    call InitTrig_Escape_UI()
    call InitTrig_Change_Target()
    call InitTrig_Victory_Air_Force()
    call InitTrig_Victory_Ground_Force_Kill()
    call InitTrig_Victory_Ground_Force_Time()
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Initialization)
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)

    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)

    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)

    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_028
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)

    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)

    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)

    // Force: TRIGSTR_029
    call SetPlayerTeam(Player(2), 1)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 1)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)

    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)

    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount(0, 1)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(1, 1)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(2, 3)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(3, 3)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    local weathereffect we
    call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 2816.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 1536.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 1536.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 2816.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    set we=AddWeatherEffect(Rect(- 4096.0, - 4096.0, 3584.0, 2560.0), 'RLhr')
    call EnableWeatherEffect(we, true)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs485102218")
call ExecuteFunc("TimerUtils___init")
call ExecuteFunc("CameraPosSync___Init")
set SOUND_MACHINEGUN=(s__SoundUtils___soundhelper_create((("Units\\Human\\GyroCopter\\GyrocopterImpactHit1.wav" ) ) , ( ( 750 ) ) , ( ( false ) ) , ( ( true) ) , ( true ) , ( 10 ) , ( 10 ) , ( "CombatSoundsEAX"))) // INLINED!!

    call InitGlobals()
    call InitCustomTriggers()
    call ConditionalTriggerExecute(gg_trg_Initialization) // INLINED!!

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName("TRIGSTR_003")
    call SetMapDescription("TRIGSTR_039")
    call SetPlayers(4)
    call SetTeams(4)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)

    call DefineStartLocation(0, - 512.0, - 1024.0)
    call DefineStartLocation(1, - 512.0, - 1024.0)
    call DefineStartLocation(2, - 1408.0, 320.0)
    call DefineStartLocation(3, 64.0, 320.0)

    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

//Functions for BigArrays:
function sa__Stack_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            local integer n
            loop
                set n=s__Stack_top[this]
                exitwhen n == 0
                set s__Stack_top[this]=s__Stack_next[n]
                set s__Stack_next[n]=s__Stack_free
                set s__Stack_free=n
            endloop
   return true
endfunction
function sa__SoundUtils___soundrecycler_onDestroy takes nothing returns boolean
local integer this=f__arg_this
        call RemoveSavedInteger(SoundUtils___rt, s__SoundUtils___soundrecycler_sh[this], GetHandleId(s__SoundUtils___soundrecycler_s[this]))
        call ReleaseTimer(s__SoundUtils___soundrecycler_t[this])
   return true
endfunction
function sa___prototype32_SoundUtils___HookStopSound takes nothing returns boolean
    call SoundUtils___HookStopSound(f__arg_sound1,f__arg_boolean1,f__arg_boolean2)
    return true
endfunction

function jasshelper__initstructs485102218 takes nothing returns nothing
    set st__Stack_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__Stack_onDestroy,Condition( function sa__Stack_onDestroy))
    set st__SoundUtils___soundrecycler_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__SoundUtils___soundrecycler_onDestroy,Condition( function sa__SoundUtils___soundrecycler_onDestroy))
    set st___prototype32[1]=CreateTrigger()
    call TriggerAddAction(st___prototype32[1],function sa___prototype32_SoundUtils___HookStopSound)
    call TriggerAddCondition(st___prototype32[1],Condition(function sa___prototype32_SoundUtils___HookStopSound))





    call ExecuteFunc("s__Stack_onInit")
endfunction

