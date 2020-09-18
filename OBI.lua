msg = MESSAGE:New("Test",10)
msg:ToAll()

do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

end
--spawn the Awacs aircraft for both coalitions
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
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Maykop" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Maykop" )
A2ADispatcher:SetSquadronOverhead( "Maykop", 1.3 )
A2ADispatcher:SetSquadronGrouping( "Maykop", 4 )

A2ADispatcher:SetSquadron( "Novo", AIRBASE.Caucasus.Novorossiysk, { "SQS27", "SQM27" }, 40 )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Novo" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Novo" )
A2ADispatcher:SetSquadronOverhead( "Novo", 1.3 )
A2ADispatcher:SetSquadronGrouping( "Novo", 3 )

A2ADispatcher_Red:SetSquadron( "Maykop2", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQM31", "SQM25" }, 20 )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Maykop2" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Maykop2" )
A2ADispatcher:SetSquadronOverhead( "Maykop2", 1.3 )
A2ADispatcher:SetSquadronGrouping( "Maykop2", 4 )

A2ADispatcher:SetSquadron( "Novo2", AIRBASE.Caucasus.Novorossiysk, { "SQS27", "SQM27" }, 40 )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Novo2" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Novo2" )
A2ADispatcher:SetSquadronOverhead( "Novo2", 1.3 )
A2ADispatcher:SetSquadronGrouping( "Novo2", 3 )

A2ADispatcher:SetSquadron( "NovoK1", AIRBASE.Caucasus.Novorossiysk, { "SQS33" }, 26 )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "NovoK1" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "NovoK1" )
A2ADispatcher:SetSquadronOverhead( "NovoK1", 1.3 )
A2ADispatcher:SetSquadronGrouping( "NovoK1", 2 )

A2ADispatcher:SetSquadron( "NovoK2", AIRBASE.Caucasus.Novorossiysk, { "SQS33" }, 26 )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "NovoK2" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "NovoK2" )
A2ADispatcher:SetSquadronOverhead( "NovoK2", 1.3 )
A2ADispatcher:SetSquadronGrouping( "NovoK2", 2 )

CAPZoneCoast = ZONE_POLYGON:New( "CAP Zone Coast", GROUP:FindByName( "CAP Zone Coast" ) )
CAPZoneKuz = ZONE_POLYGON:New( "CAP Zone Kuz", GROUP:FindByName( "CAP Zone Kuz" ) )
CAPZoneMount = ZONE_POLYGON:New( "CAP Zone Mount", GROUP:FindByName( "CAP Zone Mount" ) )

A2ADispatcher:SetSquadronCap( "Maykop", CAPZoneMount, 4000, 10000, 500, 600, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "Maykop", 6, 30, 60, 1 )
A2ADispatcher:SetSquadronCap( "Novo", CAPZoneCoast, 4000, 10000, 500, 600, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "Novo", 6, 30, 60, 1 )
A2ADispatcher:SetSquadronCap( "NovoK1", CAPZoneKuz, 4000, 10000, 500, 600, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "NovoK1", 6, 30, 60, 1 )
A2ADispatcher:SetSquadronCap( "NovoK2", CAPZoneKuz, 4000, 10000, 500, 600, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "NovoK2", 6, 30, 60, 1 )

A2ADispatcher:SetSquadronGci2( "Novo2", 900, 2100, 100, 100, "RADIO" )
A2ADispatcher:SetSquadronGci2( "Maykop2", 900, 1200, 200, 200, "RADIO" )
A2ADispatcher:SetSquadronLanguage( "Novo2", "RU" )
A2ADispatcher:SetSquadronLanguage( "Maykop2", "RU" )
A2ADispatcher:SetSquadronRadioFrequency( "Novo2", 127.5 )
A2ADispatcher:SetSquadronRadioFrequency( "Maykop2", 127.5 )
A2ADispatcher:SetSquadronLanguage( "Novo", "RU" )
A2ADispatcher:SetSquadronLanguage( "Maykop", "RU" )
A2ADispatcher:SetSquadronRadioFrequency( "Novo", 127.5 )
A2ADispatcher:SetSquadronRadioFrequency( "Maykop", 127.5 )

--Red A2ADispatcher end

local EWR_Blue = SET_GROUP:New()
EWR_Blue:FilterPrefixes( { "US Awacs", "US EWR"} ) 
EWR_Blue:FilterStart()
local Detection_Blue = DETECTION_AREAS:New( EWR_Blue, 30000 )
A2ADispatcher_Blue = AI_A2A_DISPATCHER:New( Detection_Blue )
A2ADispatcher_Blue:SetCommandCenter( US_CC )
A2ADispatcher_Blue:SetEngageRadius( 120000 )


CapSpawn = SPAWN:New( "Rus1" )
    --:InitLimit(6,12)
    :InitRepeatOnLanding()                                                               
    :OnSpawnGroup(                                                                 
        function ( SpawnGroup )
			PatrolZone = ZONE:New( "PatrolZoneR" ) -- Start of the Cap setup
			AICapZone = AI_CAP_ZONE:New( PatrolZone, 2500, 9000, 400, 700 )
			AICapZone:SetControllable( SpawnGroup )                                   
			AICapZone:SetEngageRange( 20000 )    
			AICapZone:__Start( 1 ) --end of the Cap setup
        function SpawnGroup:OnEventCrash( EventData )  --start of eventhandling
            if SpawnGroup:GetSize() == 1 then
                SpawnGroup:Respawn()
            end                      
        end  -- end of eventhandling
    end
    )
CapSpawn:Spawn()

CapKSpawn = SPAWN:New( "RusK" )
    --:InitLimit(6,12)
    :InitRepeatOnLanding()                                                               
    :OnSpawnGroup(                                                                 
        function ( SpawnGroup )
        PatrolZoneK = ZONE:New( "PatrolZoneK" ) -- Start of the Cap setup
        AICapKZone = AI_CAP_ZONE:New( PatrolZoneK, 2500, 9000, 400, 700 )
        AICapKZone:SetControllable( SpawnGroup )                                   
        AICapKZone:SetEngageRange( 20000 )    
        AICapKZone:__Start( 1 ) --end of the Cap setup
        function SpawnGroupK:OnEventCrash( EventData )  --start of eventhandling
            if SpawnGroupK:GetSize() == 1 then
                SpawnGroupK:Respawn()
            end                      
        end  -- end of eventhandling
    end
    )
CapKSpawn:Spawn()