do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

end
--spawn the Awacs aircraft for both coalitions
R1AwacsSpawn = SPAWN:New( "RU Awacs 1" )
	:InitLimit(1,2)
	:InitRepeatOnLanding()
	:OnSpawnGroup(
	function A1Group:OnEventCrash( EventData )  --start of eventhandling
        A1Group:Respawn()                             
    end  -- end of eventhandling
	)
R1AwacsSpawn:Spawn()

R2AwacsSpawn = SPAWN:New( "RU Awacs 2" )
	:InitLimit(1,2)
	:InitRepeatOnLanding()
	:OnSpawnGroup(
	function A2Group:OnEventCrash( EventData )  --start of eventhandling
        A2Group:Respawn()                             
    end  -- end of eventhandling
	)
R2AwacsSpawn:Spawn()

U1AwacsSpawn = SPAWN:New( "US Awacs 1" )
	:InitLimit(1,2)
	:InitRepeatOnLanding()
	:OnSpawnGroup(
	function U1Group:OnEventCrash( EventData )  --start of eventhandling
        U1Group:Respawn()                             
    end  -- end of eventhandling
	)
U1AwacsSpawn:Spawn()

U2AwacsSpawn = SPAWN:New( "US Awacs 2" )
	:InitLimit(1,2)
	:InitRepeatOnLanding()
	:OnSpawnGroup(
	function U1Group:OnEventCrash( EventData )  --start of eventhandling
        U1Group:Respawn()                             
    end  -- end of eventhandling
	)
U2AwacsSpawn:Spawn()

--Add the EWR and Aircraft to the A2A_Dispatcher defense network

local EWR_Red = SET_GROUP:New()
EWR_Red:FilterPrefixes( { "RU Awacs", "RU EWR"} )
EWR_Red:FilterStart()
local Detection_Red = DETECTION_AREAS:New( EWR_Red, 30000 )
A2ADispatcher_Red = AI_A2A_DISPATCHER:New( Detection_Red )

local EWR_Blue = SET_GROUP:New()
EWR_Blue:FilterPrefixes( { "US Awacs", "US EWR"} ) 
EWR_Blue:FilterStart()
local Detection_Blue = DETECTION_AREAS:New( EWR_Blue, 30000 )
A2ADispatcher_Blue = AI_A2A_DISPATCHER:New( Detection_Blue )

A2ADispatcher_Red:SetCommandCenter( RU_CC )
A2ADispatcher_Blue:SetCommandCenter( US_CC )


CapSpawn = SPAWN:New( "Rus1" )
    :InitLimit(6,12)
    :InitRepeatOnLanding()                                                               
    :OnSpawnGroup(                                                                 
        function ( SpawnGroup )
			PatrolZone = ZONE:New( "PatrolZoneR" ) -- Start of the Cap setup
			AICapZone = AI_CAP_ZONE:New( PatrolZone, 500, 1000, 500, 600 )
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

CapKSpawn = SPAWN:New( "RusK" ) --1495088-8
    :InitLimit(6,12)
    :InitRepeatOnLanding()                                                               
    :OnSpawnGroup(                                                                 
        function ( SpawnGroup )
        PatrolZoneK = ZONE:New( "PatrolZoneK" ) -- Start of the Cap setup
        AICapKZone = AI_CAP_ZONE:New( PatrolZoneK, 500, 1000, 500, 600 )
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

Cas1Spawn = SPAWN:New( "RusCAS" )
    :InitLimit(6,12)
    :InitRepeatOnLanding()                                                               
    :OnSpawnGroup(                                                                 
        function ( Cas1Spawn )
        CASEngagementZone1 = ZONE:New( "Frontline1" ) -- Start of the Cas setup
        RuCasZone = AI_CAS_ZONE:New( PatrolZone, 500, 1000, 500, 600, CASEngagementZone1 )
        Targets = GROUP:FindByName("NATO frontline units")
		AICasZone:SetControllable( Cas1Spawn )		
        AICasZone:__Start( 1 ) --end of the Cas setup
        function Cas1Spawn:OnEventCrash( EventData )  --start of eventhandling
            if Cas1Spawn:GetSize() == 1 then
                Cas1Spawn:Respawn()
            end                      
        end  -- end of eventhandling
    end
    )
Cas1Spawn:Spawn()

