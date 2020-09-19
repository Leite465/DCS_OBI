do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

end

do -- Missions
  
  US_Mission_OBI = MISSION:New( US_CC, "Operation Burning Ice", "Primary",
    "Welcome pilot. We need to consolidate out position on the theater.\n" ..
    "There are 3 enemy strategic areas(capture points) located at region as shown on the briefing.\n" ..
    "Eliminate all resistance on the areas, so our helicopters can unload troops and hardware, " ..
    "if we have troops on the ground the area will be in our control.\n " .. 
    "The orders are to hold position until all capture zones are taken.\n" ..
    "Use the map (F10) or the briefing for a clear indication of the location of each zone.\n" ..
    "Note that heavy resistance can be expected at the zones!\n" ..
    "The Operations will be completed when all capture zones are taken, and held for at least 5 minutes!"
    , coalition.side.BLUE)
    
  US_Score = SCORING:New( "CAZ-001 - Capture Zone" )
    
  US_Mission_OBI:AddScoring( US_Score )
  
  US_Mission_OBI:Start()

end

do -- Missions
  
  RU_Mission_OBI = MISSION:New( RU_CC, "Operation Burning Ice", "Primary",
    "Welcome pilot. We need to consolidate out position on the theater.\n" ..
    "There are 3 enemy strategic areas(capture points) located at region as shown on the briefing.\n" ..
    "Eliminate all resistance on the areas, so our helicopters can unload troops and hardware, " ..
    "if we have troops on the ground the area will be in our control.\n " .. 
    "The orders are to hold position until all capture zones are taken.\n" ..
    "Use the map (F10) or the briefing for a clear indication of the location of each zone.\n" ..
    "Note that heavy resistance can be expected at the zones!\n" ..
    "The Operations will be completed when all capture zones are taken, and held for at least 5 minutes!"
    , coalition.side.RED)
    
  RU_Score = SCORING:New( "CAZ-001 - Capture Zone" )
    
  RU_Mission_OBI:AddScoring( RU_Score )
  
  RU_Mission_OBI:Start()

end

CaptureZone1 = ZONE:New( "Capture Zone 1" )
CaptureZone2 = ZONE:New( "Capture Zone 2" )
CaptureZone3 = ZONE:New( "Capture Zone 3" )
CaptureZone4 = ZONE:New( "Capture Zone 4" )

ZoneCaptureCoalition_Red1 = ZONE_CAPTURE_COALITION:New( CaptureZone1, coalition.side.BLUE )
ZoneCaptureCoalition_Blue1 = ZONE_CAPTURE_COALITION:New( CaptureZone2, coalition.side.RED )
ZoneCaptureCoalition_Red2 = ZONE_CAPTURE_COALITION:New( CaptureZone3, coalition.side.BLUE )
ZoneCaptureCoalition_Blue2 = ZONE_CAPTURE_COALITION:New( CaptureZone4, coalition.side.RED )

function ZoneCaptureCoalition_Red1:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
      ZoneCaptureCoalition_Red1:Smoke( SMOKECOLOR.Blue )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
    else
      ZoneCaptureCoalition_Red1:Smoke( SMOKECOLOR.Red )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
    end
  end
end

--function ZoneCaptureCoalition:OnEnterEmpty()
--  ZoneCaptureCoalition:Smoke( SMOKECOLOR.Green )
--  US_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--  RU_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--end

function ZoneCaptureCoalition_Red1:OnEnterAttacked()
  ZoneCaptureCoalition_Red1:Smoke( SMOKECOLOR.White )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    US_CC:MessageTypeToCoalition( string.format( "%s is under attack by Russia", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
  else
    RU_CC:MessageTypeToCoalition( string.format( "%s is under attack by the USA", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition_Red1:OnEnterCaptured()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    RU_CC:MessageTypeToCoalition( string.format( "%s is captured by the USA, we lost it!", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
  else
    US_CC:MessageTypeToCoalition( string.format( "%s is captured by Russia, we lost it!", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Red1:GetZoneName() ), MESSAGE.Type.Information )
  end
  
  self:AddScore( "Captured", "Zone captured: Extra points granted.", 200 )    
  
  self:__Guard( 30 )
end

--zone 2

function ZoneCaptureCoalition_Blue1:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
      ZoneCaptureCoalition_Blue1:Smoke( SMOKECOLOR.Blue )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
    else
      ZoneCaptureCoalition_Blue1:Smoke( SMOKECOLOR.Red )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
    end
  end
end

--function ZoneCaptureCoalition:OnEnterEmpty()
--  ZoneCaptureCoalition:Smoke( SMOKECOLOR.Green )
--  US_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--  RU_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--end

function ZoneCaptureCoalition_Blue1:OnEnterAttacked()
  ZoneCaptureCoalition_Blue1:Smoke( SMOKECOLOR.White )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    US_CC:MessageTypeToCoalition( string.format( "%s is under attack by Russia", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
  else
    RU_CC:MessageTypeToCoalition( string.format( "%s is under attack by the USA", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition_Blue1:OnEnterCaptured()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    RU_CC:MessageTypeToCoalition( string.format( "%s is captured by the USA, we lost it!", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
  else
    US_CC:MessageTypeToCoalition( string.format( "%s is captured by Russia, we lost it!", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Blue1:GetZoneName() ), MESSAGE.Type.Information )
  end
  
  self:AddScore( "Captured", "Zone captured: Extra points granted.", 200 )    
  
  self:__Guard( 30 )
end

--zone 3

function ZoneCaptureCoalition_Red2:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
      ZoneCaptureCoalition_Red2:Smoke( SMOKECOLOR.Blue )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
    else
      ZoneCaptureCoalition_Red2:Smoke( SMOKECOLOR.Red )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
    end
  end
end

--function ZoneCaptureCoalition:OnEnterEmpty()
--  ZoneCaptureCoalition:Smoke( SMOKECOLOR.Green )
--  US_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--  RU_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--end

function ZoneCaptureCoalition_Red2:OnEnterAttacked()
  ZoneCaptureCoalition_Red2:Smoke( SMOKECOLOR.White )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    US_CC:MessageTypeToCoalition( string.format( "%s is under attack by Russia", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
  else
    RU_CC:MessageTypeToCoalition( string.format( "%s is under attack by the USA", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition_Red2:OnEnterCaptured()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    RU_CC:MessageTypeToCoalition( string.format( "%s is captured by the USA, we lost it!", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
  else
    US_CC:MessageTypeToCoalition( string.format( "%s is captured by Russia, we lost it!", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Red2:GetZoneName() ), MESSAGE.Type.Information )
  end
  
  self:AddScore( "Captured", "Zone captured: Extra points granted.", 200 )    
  
  self:__Guard( 30 )
end

--zone 4


function ZoneCaptureCoalition_Blue2:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
      ZoneCaptureCoalition_Blue2:Smoke( SMOKECOLOR.Blue )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of the USA", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
    else
      ZoneCaptureCoalition_Blue2:Smoke( SMOKECOLOR.Red )
      RU_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
      US_CC:MessageTypeToCoalition( string.format( "%s is under protection of Russia", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
    end
  end
end

--function ZoneCaptureCoalition:OnEnterEmpty()
--  ZoneCaptureCoalition:Smoke( SMOKECOLOR.Green )
--  US_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--  RU_CC:MessageTypeToCoalition( string.format( "%s is unprotected, and can be captured!", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--end

function ZoneCaptureCoalition_Blue2:OnEnterAttacked()
  ZoneCaptureCoalition_Blue2:Smoke( SMOKECOLOR.White )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    US_CC:MessageTypeToCoalition( string.format( "%s is under attack by Russia", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
  else
    RU_CC:MessageTypeToCoalition( string.format( "%s is under attack by the USA", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition_Blue2:OnEnterCaptured()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    RU_CC:MessageTypeToCoalition( string.format( "%s is captured by the USA, we lost it!", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
  else
    US_CC:MessageTypeToCoalition( string.format( "%s is captured by Russia, we lost it!", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneCaptureCoalition_Blue2:GetZoneName() ), MESSAGE.Type.Information )
  end
  
  self:AddScore( "Captured", "Zone captured: Extra points granted.", 200 )    
  
  self:__Guard( 30 )
end

--spawn the Awacs and Tanker aircraft for both coalitions

R1AwacsSpawn = SPAWN:New( "RU Awacs 1" )
    :InitRepeatOnLanding()
    :OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
R1AwacsSpawn:Spawn()

R1TankerSpawn = SPAWN:New( "RU Tanker 1" )
    :InitRepeatOnLanding()
    :OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
R1TankerSpawn:Spawn()

R2AwacsSpawn = SPAWN:New( "RU Awacs 2" )
	:InitRepeatOnLanding()
	:OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
R2AwacsSpawn:Spawn()

R2TankerSpawn = SPAWN:New( "RU Tanker 2" )
    :InitRepeatOnLanding()
    :OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
R2TankerSpawn:Spawn()

U1AwacsSpawn = SPAWN:New( "US Awacs 1" )
    :InitRepeatOnLanding()
    :OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
U1AwacsSpawn:Spawn()

U1TankerSpawn = SPAWN:New( "US Tanker 1" )
    :InitRepeatOnLanding()
    :OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
U1TankerSpawn:Spawn()

U2AwacsSpawn = SPAWN:New( "US Awacs 2" )
	:InitRepeatOnLanding()
	:OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
U2AwacsSpawn:Spawn()

U2TankerSpawn = SPAWN:New( "US Tanker 2" )
    :InitRepeatOnLanding()
    :OnSpawnGroup(
        function (SpawnGroup)
            function SpawnGroup:OnEventCrash( EventData )
                SpawnGroup:Respawn()
            end
        end
    )
U2TankerSpawn:Spawn()

--Now Spawning EWR

BlueEWR1 = SPAWN
:New( "US EWR 1" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

BlueEWR2 = SPAWN
:New( "US EWR 2" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

BlueEWR3 = SPAWN
:New( "US EWR 3" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

BlueEWR4 = SPAWN
:New( "US EWR 4" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

RedEWR1 = SPAWN
:New( "RU EWR 1" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

RedEWR2 = SPAWN
:New( "RU EWR 2" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

RedEWR3 = SPAWN
:New( "RU EWR 3" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

RedEWR4 = SPAWN
:New( "RU EWR 4" )
:InitLimit( 1, 8 )
:InitRandomizePosition( true, 100, 50 )
:SpawnScheduled( 4000, .5 )

--Add the EWR and Aircraft to the A2A_Dispatcher defense network
--Red A2ADispatcher

local EWR_Red = SET_GROUP:New()
EWR_Red:FilterPrefixes( { "RU Awacs", "RU EWR", "1L13 EWR"} )
EWR_Red:FilterStart()
local Detection_Red = DETECTION_AREAS:New( EWR_Red, 30000 )--30km Detection area
A2ADispatcher_Red = AI_A2A_DISPATCHER:New( Detection_Red )
A2ADispatcher_Red:SetCommandCenter( RU_CC )
A2ADispatcher_Red:SetEngageRadius( 120000 )--120km engage radius(~60nm)

A2ADispatcher_Red:SetSquadron( "Maykop", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQM31", "SQM25", "SQM29" }, 50 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Maykop" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Maykop" )
A2ADispatcher_Red:SetSquadronOverhead( "Maykop", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Maykop", 4 )

A2ADispatcher_Red:SetSquadron( "Novo", AIRBASE.Caucasus.Novorossiysk, { "SQS27", "SQM23", "SQM29" }, 50 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Novo" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Novo" )
A2ADispatcher_Red:SetSquadronOverhead( "Novo", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Novo", 3 )

A2ADispatcher_Red:SetSquadron( "NovoK", AIRBASE.Caucasus.Novorossiysk, { "SQS33" }, 50 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "NovoK" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "NovoK" )
A2ADispatcher_Red:SetSquadronOverhead( "NovoK", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "NovoK", 2 )

A2ADispatcher_Red:SetSquadron( "Mozdok", AIRBASE.Caucasus.Mozdok, { "SQS27", "SQM23", "SQM29" }, 100 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Mozdok" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Mozdok" )
A2ADispatcher_Red:SetSquadronOverhead( "Mozdok", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Mozdok", 4 )

CAPZoneCoast = ZONE_POLYGON:New( "CAP Zone Coast", GROUP:FindByName( "CAP Zone Coast" ) )
CAPZoneKuz = ZONE_POLYGON:New( "CAP Zone Kuz", GROUP:FindByName( "CAP Zone Kuz" ) )
CAPZoneMount = ZONE_POLYGON:New( "CAP Zone Mount", GROUP:FindByName( "CAP Zone Mount" ) )
CAPZoneEasts = ZONE_POLYGON:New( "CAP Zone Easts", GROUP:FindByName( "CAP Zone Easts" ) )

A2ADispatcher_Red:SetSquadronCap( "Maykop", CAPZoneMount, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Maykop", 2, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Novo", CAPZoneCoast, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Novo", 2, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "NovoK", CAPZoneKuz, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "NovoK", 1, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Mozdok", CAPZoneEasts, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Mozdok", 4, 180, 600 )

--Red A2ADispatcher end, begins blue

local EWR_Blue = SET_GROUP:New()
EWR_Blue:FilterPrefixes( { "US Awacs", "US EWR", "Hawk sr"} ) 
EWR_Blue:FilterStart()
local Detection_Blue = DETECTION_AREAS:New( EWR_Blue, 30000 )
A2ADispatcher_Blue = AI_A2A_DISPATCHER:New( Detection_Blue )
A2ADispatcher_Blue:SetCommandCenter( US_CC )
A2ADispatcher_Blue:SetEngageRadius( 120000 )

A2ADispatcher_Blue:SetSquadron( "Senaki", AIRBASE.Caucasus.Senaki_Kolkhi, { "SQF18", "SQF16", "SQF15" }, 50 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "Senaki" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "Senaki" )
A2ADispatcher_Blue:SetSquadronOverhead( "Senaki", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "Senaki", 4 )

A2ADispatcher_Blue:SetSquadron( "Kobuleti", AIRBASE.Caucasus.Kobuleti, { "SQF18", "SQF16", "SQF15" }, 50 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "Kobuleti" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "Kobuleti" )
A2ADispatcher_Blue:SetSquadronOverhead( "Kobuleti", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "Kobuleti", 4 )

A2ADispatcher_Blue:SetSquadron( "KobuletiN", AIRBASE.Caucasus.Kobuleti, { "SQF18", "SQF14" }, 50 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "KobuletiN" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "KobuletiN" )
A2ADispatcher_Blue:SetSquadronOverhead( "KobuletiN", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "KobuletiN", 2 )

A2ADispatcher_Blue:SetSquadron( "Vaziani", AIRBASE.Caucasus.Vaziani, { "SQF18", "SQF16", "SQF15" }, 100 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "Vaziani" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "Vaziani" )
A2ADispatcher_Blue:SetSquadronOverhead( "Vaziani", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "Vaziani", 4 )

CAPZoneCoasts = ZONE_POLYGON:New( "CAP Zone Coasts", GROUP:FindByName( "CAP Zone Coasts" ) )
CAPZoneStennis = ZONE_POLYGON:New( "CAP Zone Stennis", GROUP:FindByName( "CAP Zone Stennis" ) )
CAPZoneMounts = ZONE_POLYGON:New( "CAP Zone Mounts", GROUP:FindByName( "CAP Zone Mounts" ) )
CAPZoneEast = ZONE_POLYGON:New( "CAP Zone East", GROUP:FindByName( "CAP Zone East" ) )

A2ADispatcher_Blue:SetSquadronCap( "Senaki", CAPZoneMounts, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "Senaki", 2, 200, 800 )
A2ADispatcher_Blue:SetSquadronCap( "Kobuleti", CAPZoneCoasts, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "Kobuleti", 2, 200, 800 )
A2ADispatcher_Blue:SetSquadronCap( "KobuletiN", CAPZoneStennis, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "KobuletiN", 1, 200, 800 )
A2ADispatcher_Blue:SetSquadronCap( "Vaziani", CAPZoneEast, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "Vaziani", 4, 200, 800 )

Csar_Red = MISSION
  :New( RU_CC, "CSAR Missions", "Tactical", "Rescue downed pilots.", coalition.side.RED )

  RRGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "FARP Torba", "FARP Skala", "Gelendzhik" ):FilterStart()

  TaskDispatcher = TASK_CARGO_DISPATCHER:New( Csar_Red, RRGroups )

  TaskDispatcher:StartCSARTasks( 
  "CSAR", 
  { ZONE_UNIT:New( "RU Hospital", STATIC:FindByName( "RU Hospital" ), 100 ) }, 
  "One of our pilots has ejected. Go out to Search and Rescue our pilot!\n" .. 
  "Use the radio menu to let the command center assist you with the CSAR tasking."
)

function TaskDispatcher:OnAfterCargoDeployed( From, Event, To, Task, TaskPrefix, TaskUnit, Cargo, DeployZone )

  MESSAGE:NewType( "Unit " .. TaskUnit:GetName().. " has deployed cargo " .. Cargo:GetName() .. " at zone " .. DeployZone:GetName() .. " for task " .. Task:GetName() .. ".", MESSAGE.Type.Information ):ToRed()
  
end

Csar_Blue = MISSION
  :New( US_CC, "CSAR Missions", "Tactical", "Rescue downed pilots.", coalition.side.BLUE )

  BRGroups = SET_GROUP:New():FilterCoalitions( "blue" ):FilterPrefixes( "FARP Paris", "FARP Rome", "FARP London" ):FilterStart()

  TaskDispatcher = TASK_CARGO_DISPATCHER:New( Csar_Blue, BRGroups )

  TaskDispatcher:StartCSARTasks( 
  "CSAR", 
  { ZONE_UNIT:New( "US Hospital", STATIC:FindByName( "US Hospital" ), 100 ) }, 
  "One of our pilots has ejected. Go out to Search and Rescue our pilot!\n" .. 
  "Use the radio menu to let the command center assist you with the CSAR tasking."
)

function TaskDispatcher:OnAfterCargoDeployed( From, Event, To, Task, TaskPrefix, TaskUnit, Cargo, DeployZone )

  MESSAGE:NewType( "Unit " .. TaskUnit:GetName().. " has deployed cargo " .. Cargo:GetName() .. " at zone " .. DeployZone:GetName() .. " for task " .. Task:GetName() .. ".", MESSAGE.Type.Information ):ToBlue()
  
end



--CapSpawn = SPAWN:New( "Rus1" )
--    --:InitLimit(6,12)
--    :InitRepeatOnLanding()                                                               
--    :OnSpawnGroup(                                                                 
--        function ( SpawnGroup )
--			PatrolZone = ZONE:New( "PatrolZoneR" ) -- Start of the Cap setup
--			AICapZone = AI_CAP_ZONE:New( PatrolZone, 2500, 9000, 400, 700 )
--			AICapZone:SetControllable( SpawnGroup )                                   
--			AICapZone:SetEngageRange( 20000 )    
--			AICapZone:__Start( 1 ) --end of the Cap setup
--        function SpawnGroup:OnEventCrash( EventData )  --start of eventhandling
--            if SpawnGroup:GetSize() == 1 then
--                SpawnGroup:Respawn()
--            end                      
--        end  -- end of eventhandling
--    end
--    )
--CapSpawn:Spawn()