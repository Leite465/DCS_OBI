msg = MESSAGE:New("Test",10)
msg:ToAll()

do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

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
	--:InitLimit(1,2)
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
	--:InitLimit(1,2)
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



--Add the EWR and Aircraft to the A2A_Dispatcher defense network
--Red A2ADispatcher

local EWR_Red = SET_GROUP:New()
EWR_Red:FilterPrefixes( { "RU Awacs", "RU EWR"} )
EWR_Red:FilterStart()
local Detection_Red = DETECTION_AREAS:New( EWR_Red, 30000 )--30km Detection area
A2ADispatcher_Red = AI_A2A_DISPATCHER:New( Detection_Red )
A2ADispatcher_Red:SetCommandCenter( RU_CC )
A2ADispatcher_Red:SetEngageRadius( 120000 )--120km engage radius(~60nm)

A2ADispatcher_Red:SetSquadron( "Maykop", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQM31", "SQM25" }, 20 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Maykop" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Maykop" )
A2ADispatcher_Red:SetSquadronOverhead( "Maykop", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Maykop", 4 )

A2ADispatcher_Red:SetSquadron( "Novo", AIRBASE.Caucasus.Novorossiysk, { "SQS27", "SQM23" }, 40 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Novo" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Novo" )
A2ADispatcher_Red:SetSquadronOverhead( "Novo", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Novo", 3 )

A2ADispatcher_Red:SetSquadron( "NovoK", AIRBASE.Caucasus.Novorossiysk, { "SQS33" }, 16 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "NovoK" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "NovoK" )
A2ADispatcher_Red:SetSquadronOverhead( "NovoK", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "NovoK", 2 )

CAPZoneCoast = ZONE_POLYGON:New( "CAP Zone Coast", GROUP:FindByName( "CAP Zone Coast" ) )
CAPZoneKuz = ZONE_POLYGON:New( "CAP Zone Kuz", GROUP:FindByName( "CAP Zone Kuz" ) )
CAPZoneMount = ZONE_POLYGON:New( "CAP Zone Mount", GROUP:FindByName( "CAP Zone Mount" ) )

A2ADispatcher_Red:SetSquadronCap( "Maykop", CAPZoneMount, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Maykop", 2, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Novo", CAPZoneCoast, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Novo", 2, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "NovoK", CAPZoneKuz, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "NovoK", 2, 180, 600 )

--Red A2ADispatcher end, begins blue

local EWR_Blue = SET_GROUP:New()
EWR_Blue:FilterPrefixes( { "US Awacs", "US EWR"} ) 
EWR_Blue:FilterStart()
local Detection_Blue = DETECTION_AREAS:New( EWR_Blue, 30000 )
A2ADispatcher_Blue = AI_A2A_DISPATCHER:New( Detection_Blue )
A2ADispatcher_Blue:SetCommandCenter( US_CC )
A2ADispatcher_Blue:SetEngageRadius( 120000 )

A2ADispatcher_Blue:SetSquadron( "Senaki", AIRBASE.Caucasus.Senaki_Kolkhi, { "SQF18", "SQF16", "SQF15" }, 20 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "Senaki" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "Senaki" )
A2ADispatcher_Blue:SetSquadronOverhead( "Senaki", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "Senaki", 4 )

A2ADispatcher_Blue:SetSquadron( "Kobuleti", AIRBASE.Caucasus.Kobuleti, { "SQF18", "SQF16", "SQF15" }, 20 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "Kobuleti" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "Kobuleti" )
A2ADispatcher_Blue:SetSquadronOverhead( "Kobuleti", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "Kobuleti", 4 )

A2ADispatcher_Blue:SetSquadron( "KobuletiN", AIRBASE.Caucasus.Kobuleti, { "SQF18" }, 20 )
A2ADispatcher_Blue:SetSquadronTakeoffFromParkingHot( "KobuletiN" )
A2ADispatcher_Blue:SetSquadronLandingAtEngineShutdown( "KobuletiN" )
A2ADispatcher_Blue:SetSquadronOverhead( "KobuletiN", 1.3 )
A2ADispatcher_Blue:SetSquadronGrouping( "KobuletiN", 2 )

CAPZoneCoasts = ZONE_POLYGON:New( "CAP Zone Coasts", GROUP:FindByName( "CAP Zone Coasts" ) )
CAPZoneStennis = ZONE_POLYGON:New( "CAP Zone Stennis", GROUP:FindByName( "CAP Zone Stennis" ) )
CAPZoneMounts = ZONE_POLYGON:New( "CAP Zone Mounts", GROUP:FindByName( "CAP Zone Mounts" ) )

A2ADispatcher_Blue:SetSquadronCap( "Senaki", CAPZoneMounts, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "Senaki", 2, 180, 600 )
A2ADispatcher_Blue:SetSquadronCap( "Kobuleti", CAPZoneCoasts, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "Kobuleti", 2, 180, 600 )
A2ADispatcher_Blue:SetSquadronCap( "KobuletiN", CAPZoneStennis, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Blue:SetSquadronCapInterval( "KobuletiN", 2, 180, 600 )





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