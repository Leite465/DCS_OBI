do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

end

do
--create an instance of the IADS
redIADS = SkynetIADS:create('RED')
redIADS:addEarlyWarningRadarsByPrefix('EWR')
redIADS:addSAMSitesByPrefix('Sam')

commandCenter = StaticObject.getByName('REDHQS')
redIADS:addCommandCenter(commandCenter)

redIADS:addEarlyWarningRadar('RU Awacs 1')
redIADS:addEarlyWarningRadar('RU Awacs 2')

redIADS:getSAMSiteByGroupName('Sam'):setGoLiveRangeInPercent(70)

redIADS:activate()

blueIADS = SkynetIADS:create('BLUE')
blueIADS:addSAMSitesByPrefix('SpawnUS')
blueIADS:addEarlyWarningRadarsByPrefix('EWUS')
blueIADS:activate()
blueIADS:addRadioMenu()

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

--Template tables

Red_armor = { "T-1", "T-2", "T-3" }
Red_sam = { "AA-1", "AA-2", "AA-3", "AA-4", "AA-5" }
Red_aaa = { "AAA1", "AAA2" }
Us_sam = { "AA-US-1", "AA-US-2" }

Red_spawn1 = SPAWN:New( "Spawn-1" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn1:Spawn()
local Coordinate=GROUP:FindByName("Spawn-1"):GetCoordinate()
CAS1=MARKER:New(Coordinate, "CAS Target"):ToAll()


Red_spawn2 = SPAWN:New( "Spawn-2" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn2:Spawn()
local Coordinate=GROUP:FindByName("Spawn-2"):GetCoordinate()
CAS2=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn3 = SPAWN:New( "Spawn-3" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn3:Spawn()
local Coordinate=GROUP:FindByName("Spawn-3"):GetCoordinate()
CAS3=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn4 = SPAWN:New( "Spawn-4" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn4:Spawn()
local Coordinate=GROUP:FindByName("Spawn-4"):GetCoordinate()
CAS4=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn5 = SPAWN:New( "Spawn-5" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn5:Spawn()
local Coordinate=GROUP:FindByName("Spawn-5"):GetCoordinate()
CAS5=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn6 = SPAWN:New( "Spawn-6" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn6:Spawn()
local Coordinate=GROUP:FindByName("Spawn-6"):GetCoordinate()
CAS6=MARKER:New(Coordinate, "CAS Target"):ToAll()	

Red_spawn7 = SPAWN:New( "Spawn-7" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn7:Spawn()
local Coordinate=GROUP:FindByName("Spawn-7"):GetCoordinate()
CAS7=MARKER:New(Coordinate, "CAS Target"):ToAll()	

Red_spawn8 = SPAWN:New( "Spawn-8" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn8:Spawn()
local Coordinate=GROUP:FindByName("Spawn-8"):GetCoordinate()
CAS8=MARKER:New(Coordinate, "CAS Target"):ToAll()	

Red_spawn9 = SPAWN:New( "Spawn-9" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn9:Spawn()
local Coordinate=GROUP:FindByName("Spawn-9"):GetCoordinate()
CAS9=MARKER:New(Coordinate, "CAS Target"):ToAll()	

Red_spawn10 = SPAWN:New( "Spawn-10" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn10:Spawn()
local Coordinate=GROUP:FindByName("Spawn-10"):GetCoordinate()
CAS10=MARKER:New(Coordinate, "CAS Target"):ToAll()	

Red_spawn11 = SPAWN:New( "Spawn-11" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn11:Spawn()
local Coordinate=GROUP:FindByName("Spawn-11"):GetCoordinate()
CAS11=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn12 = SPAWN:New( "Spawn-12" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn12:Spawn()
local Coordinate=GROUP:FindByName("Spawn-12"):GetCoordinate()
CAS12=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn13 = SPAWN:New( "Spawn-13" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn13:Spawn()
local Coordinate=GROUP:FindByName("Spawn-13"):GetCoordinate()
CAS13=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn14 = SPAWN:New( "Spawn-14" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn14:Spawn()
local Coordinate=GROUP:FindByName("Spawn-14"):GetCoordinate()
CAS14=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn15 = SPAWN:New( "Spawn-15" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn15:Spawn()
local Coordinate=GROUP:FindByName("Spawn-15"):GetCoordinate()
CAS15=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn16 = SPAWN:New( "Spawn-16" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn16:Spawn()
local Coordinate=GROUP:FindByName("Spawn-16"):GetCoordinate()
CAS16=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn17 = SPAWN:New( "Spawn-17" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn17:Spawn()
local Coordinate=GROUP:FindByName("Spawn-17"):GetCoordinate()
CAS17=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn18 = SPAWN:New( "Spawn-18" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn18:Spawn()
local Coordinate=GROUP:FindByName("Spawn-18"):GetCoordinate()
CAS18=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn19 = SPAWN:New( "Spawn-19" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn19:Spawn()
local Coordinate=GROUP:FindByName("Spawn-19"):GetCoordinate()
CAS19=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn20 = SPAWN:New( "Spawn-20" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn20:Spawn()
local Coordinate=GROUP:FindByName("Spawn-20"):GetCoordinate()
CAS20=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn21 = SPAWN:New( "Spawn-21" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn21:Spawn()
local Coordinate=GROUP:FindByName("Spawn-21"):GetCoordinate()
CAS21=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn22 = SPAWN:New( "Spawn-22" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn22:Spawn()
local Coordinate=GROUP:FindByName("Spawn-22"):GetCoordinate()
CAS22=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn23 = SPAWN:New( "Spawn-23" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn23:Spawn()
local Coordinate=GROUP:FindByName("Spawn-23"):GetCoordinate()
CAS23=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn24 = SPAWN:New( "Spawn-24" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn24:Spawn()
local Coordinate=GROUP:FindByName("Spawn-24"):GetCoordinate()
CAS24=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn25 = SPAWN:New( "Spawn-25" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn25:Spawn()
local Coordinate=GROUP:FindByName("Spawn-25"):GetCoordinate()
CAS25=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn26 = SPAWN:New( "Spawn-26" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn26:Spawn()
local Coordinate=GROUP:FindByName("Spawn-26"):GetCoordinate()
CAS26=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn27 = SPAWN:New( "Spawn-27" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn27:Spawn()
local Coordinate=GROUP:FindByName("Spawn-27"):GetCoordinate()
CAS27=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn28 = SPAWN:New( "Spawn-28" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn28:Spawn()
local Coordinate=GROUP:FindByName("Spawn-28"):GetCoordinate()
CAS28=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn29 = SPAWN:New( "Spawn-29" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn29:Spawn()
local Coordinate=GROUP:FindByName("Spawn-29"):GetCoordinate()
CAS29=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn30 = SPAWN:New( "Spawn-30" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn30:Spawn()
local Coordinate=GROUP:FindByName("Spawn-30"):GetCoordinate()
CAS30=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn31 = SPAWN:New( "Spawn-31" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn31:Spawn()
local Coordinate=GROUP:FindByName("Spawn-31"):GetCoordinate()
CAS31=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn32 = SPAWN:New( "Spawn-32" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn32:Spawn()
local Coordinate=GROUP:FindByName("Spawn-32"):GetCoordinate()
CAS32=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn33 = SPAWN:New( "Spawn-33" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn33:Spawn()
local Coordinate=GROUP:FindByName("Spawn-33"):GetCoordinate()
CAS33=MARKER:New(Coordinate, "CAS Target"):ToAll()

Red_spawn34 = SPAWN:New( "Spawn-34" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_armor )
Red_spawn34:Spawn()
local Coordinate=GROUP:FindByName("Spawn-34"):GetCoordinate()
CAS34=MARKER:New(Coordinate, "CAS Target"):ToAll()

--Armored groups over
--AAA and IR Launchers

Red_aaa1 = SPAWN:New( "AAA-1" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa1:Spawn()
local Coordinate=GROUP:FindByName("AAA-1"):GetCoordinate()
AAA1=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa2 = SPAWN:New( "AAA-2" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa2:Spawn()
local Coordinate=GROUP:FindByName("AAA-2"):GetCoordinate()
AAA2=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa3 = SPAWN:New( "AAA-3" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa3:Spawn()
local Coordinate=GROUP:FindByName("AAA-3"):GetCoordinate()
AAA3=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa4 = SPAWN:New( "AAA-4" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa4:Spawn()
local Coordinate=GROUP:FindByName("AAA-4"):GetCoordinate()
AAA4=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa5 = SPAWN:New( "AAA-5" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa5:Spawn()
local Coordinate=GROUP:FindByName("AAA-5"):GetCoordinate()
AAA5=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa6 = SPAWN:New( "AAA-6" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa6:Spawn()
local Coordinate=GROUP:FindByName("AAA-6"):GetCoordinate()
AAA6=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa7 = SPAWN:New( "AAA-7" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa7:Spawn()
local Coordinate=GROUP:FindByName("AAA-7"):GetCoordinate()
AAA7=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa8 = SPAWN:New( "AAA-8" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa8:Spawn()
local Coordinate=GROUP:FindByName("AAA-8"):GetCoordinate()
AAA8=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

Red_aaa9 = SPAWN:New( "AAA-9" )
  :InitLimit( 20, 20 )
  :InitRandomizeTemplate( Red_aaa )
Red_aaa9:Spawn()
local Coordinate=GROUP:FindByName("AAA-9"):GetCoordinate()
AAA9=MARKER:New(Coordinate, "AAA/IR SAM Target"):ToAll()

  --AAA and IR SAMs over
  --SAM batteries

Red_sam1 = SPAWN:New( "Sam-1" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam1:Spawn()
local Coordinate=GROUP:FindByName("Sam-1"):GetCoordinate()
Sam1=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam2 = SPAWN:New( "Sam-2" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam2:Spawn()
local Coordinate=GROUP:FindByName("Sam-2"):GetCoordinate()
Sam2=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam3 = SPAWN:New( "Sam-3" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam3:Spawn()
local Coordinate=GROUP:FindByName("Sam-3"):GetCoordinate()
Sam3=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam4 = SPAWN:New( "Sam-4" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam4:Spawn()
local Coordinate=GROUP:FindByName("Sam-4"):GetCoordinate()
Sam4=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam5 = SPAWN:New( "Sam-5" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam5:Spawn()
local Coordinate=GROUP:FindByName("Sam-5"):GetCoordinate()
Sam5=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam6 = SPAWN:New( "Sam-6" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam6:Spawn()
local Coordinate=GROUP:FindByName("Sam-6"):GetCoordinate()
Sam6=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam7 = SPAWN:New( "Sam-7" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam7:Spawn()
local Coordinate=GROUP:FindByName("Sam-7"):GetCoordinate()
Sam7=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam8 = SPAWN:New( "Sam-8" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam8:Spawn()
local Coordinate=GROUP:FindByName("Sam-8"):GetCoordinate()
Sam8=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam9 = SPAWN:New( "Sam-9" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam9:Spawn()
local Coordinate=GROUP:FindByName("Sam-9"):GetCoordinate()
Sam9=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam10 = SPAWN:New( "Sam-10" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam10:Spawn()
local Coordinate=GROUP:FindByName("Sam-10"):GetCoordinate()
Sam10=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam11 = SPAWN:New( "Sam-11" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam11:Spawn()
local Coordinate=GROUP:FindByName("Sam-11"):GetCoordinate()
Sam11=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam12 = SPAWN:New( "Sam-12" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam12:Spawn()
local Coordinate=GROUP:FindByName("Sam-12"):GetCoordinate()
Sam12=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam13 = SPAWN:New( "Sam-13" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam13:Spawn()
local Coordinate=GROUP:FindByName("Sam-13"):GetCoordinate()
Sam13=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam14 = SPAWN:New( "Sam-14" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam14:Spawn()
local Coordinate=GROUP:FindByName("Sam-14"):GetCoordinate()
Sam14=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam15 = SPAWN:New( "Sam-15" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam15:Spawn()
local Coordinate=GROUP:FindByName("Sam-15"):GetCoordinate()
Sam15=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam16 = SPAWN:New( "Sam-16" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam16:Spawn()
local Coordinate=GROUP:FindByName("Sam-16"):GetCoordinate()
Sam16=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam17 = SPAWN:New( "Sam-17" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam17:Spawn()
local Coordinate=GROUP:FindByName("Sam-17"):GetCoordinate()
Sam17=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam18 = SPAWN:New( "Sam-18" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam18:Spawn()
local Coordinate=GROUP:FindByName("Sam-18"):GetCoordinate()
Sam18=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam19 = SPAWN:New( "Sam-19" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam19:Spawn()
local Coordinate=GROUP:FindByName("Sam-19"):GetCoordinate()
Sam19=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam20 = SPAWN:New( "Sam-20" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam20:Spawn()
local Coordinate=GROUP:FindByName("Sam-20"):GetCoordinate()
Sam20=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam21 = SPAWN:New( "Sam-21" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam21:Spawn()
local Coordinate=GROUP:FindByName("Sam-21"):GetCoordinate()
Sam21=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam22 = SPAWN:New( "Sam-22" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam22:Spawn()
local Coordinate=GROUP:FindByName("Sam-22"):GetCoordinate()
Sam22=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam23 = SPAWN:New( "Sam-23" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam23:Spawn()
local Coordinate=GROUP:FindByName("Sam-23"):GetCoordinate()
Sam23=MARKER:New(Coordinate, "SEAD Target"):ToAll()

Red_sam24 = SPAWN:New( "Sam-24" )
  :InitLimit( 15, 15 )
  :InitRandomizeTemplate( Red_sam )
Red_sam24:Spawn()
local Coordinate=GROUP:FindByName("Sam-24"):GetCoordinate()
Sam24=MARKER:New(Coordinate, "SEAD Target"):ToAll()

--end of SAMs
--Blue SAMs

Blue_spawn1 = SPAWN:New( "SpawnUS-1" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn1:Spawn()

Blue_spawn2 = SPAWN:New( "SpawnUS-2" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn2:Spawn()

Blue_spawn3 = SPAWN:New( "SpawnUS-3" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn3:Spawn()

Blue_spawn4 = SPAWN:New( "SpawnUS-4" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn4:Spawn()

Blue_spawn5 = SPAWN:New( "SpawnUS-5" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn5:Spawn()

Blue_spawn6 = SPAWN:New( "SpawnUS-6" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn6:Spawn()

Blue_spawn7 = SPAWN:New( "SpawnUS-7" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn7:Spawn()

Blue_spawn8 = SPAWN:New( "SpawnUS-8" )
  :InitLimit( 11, 11 )
  :InitRandomizeTemplate( Us_sam )
Blue_spawn8:Spawn()

--end of blue SAMs
--A2A Dispatcher

local EWR_Red = SET_GROUP:New()
EWR_Red:FilterPrefixes( { "RU Awacs", "RU EWR", "1L13 EWR"} )
EWR_Red:FilterStart()
local Detection_Red = DETECTION_AREAS:New( EWR_Red, 30000 )--30km Detection area
A2ADispatcher_Red = AI_A2A_DISPATCHER:New( Detection_Red )
A2ADispatcher_Red:SetCommandCenter( RU_CC )
A2ADispatcher_Red:SetEngageRadius( 100000 )--120km engage radius(~60nm)

A2ADispatcher_Red:SetSquadron( "Palmyra", AIRBASE.Syria.Palmyra, { "M31", "M23", "M29" }, 300 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Palmyra" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Palmyra" )
A2ADispatcher_Red:SetSquadronOverhead( "Palmyra", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Palmyra", 2 )
A2ADispatcher:SetSquadronFuelThreshold( "Palmyra", 0.3 )
A2ADispatcher:SetSquadronTanker( "Palmyra", "RU Tanker 2" )

A2ADispatcher_Red:SetSquadron( "Hama", AIRBASE.Syria.Hama, { "M31", "M23", "M29", "S27" }, 300 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Hama" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Hama" )
A2ADispatcher_Red:SetSquadronOverhead( "Hama", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Hama", 2 )
A2ADispatcher:SetSquadronFuelThreshold( "Hama", 0.3 )
A2ADispatcher:SetSquadronTanker( "Hama", "RU Tanker 1" )

A2ADispatcher_Red:SetSquadron( "Dumayr", AIRBASE.Syria.Al_Dumayr, { "M31", "M23", "M29", "S27" }, 300 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Dumayr" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Dumayr" )
A2ADispatcher_Red:SetSquadronOverhead( "Dumayr", 1.3 )
A2ADispatcher_Red:SetSquadronGrouping( "Dumayr", 2 )
A2ADispatcher:SetSquadronFuelThreshold( "Dumayr", 0.3 )
A2ADispatcher:SetSquadronTanker( "Dumayr", "RU Tanker 2" )

A2ADispatcher_Red:SetSquadron( "Recce", AIRBASE.Syria.Al_Dumayr, { "RC1", "RC2" }, 300 )
A2ADispatcher_Red:SetSquadronTakeoffFromParkingHot( "Recce" )
A2ADispatcher_Red:SetSquadronLandingAtEngineShutdown( "Recce" )
A2ADispatcher_Red:SetSquadronOverhead( "Recce", 0 )
A2ADispatcher_Red:SetSquadronGrouping( "Recce", 1 )

CAPZone1 = ZONE_POLYGON:New( "CAP Zone 1", GROUP:FindByName( "CAP Zone 1" ) )
CAPZone2 = ZONE_POLYGON:New( "CAP Zone 2", GROUP:FindByName( "CAP Zone 2" ) )
Recce = ZONE_POLYGON:New( "Recce", GROUP:FindByName( "Recce" ) )

A2ADispatcher_Red:SetSquadronCap( "Palmyra", CAPZone1, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Palmyra", 4, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Hama", CAPZone1, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Hama", 4, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Dumayr", CAPZone1, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Dumayr", 2, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Hama", CAPZone2, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Hama", 2, 180, 600 )
A2ADispatcher_Red:SetSquadronCap( "Recce", Recce, 4000, 10000, 500, 600, 600, 900 )
A2ADispatcher_Red:SetSquadronCapInterval( "Recce", 4, 180, 600 )

local Coordinate=STATIC:FindByName("Hospital 1"):GetCoordinate()
H1=MARKER:New(Coordinate, "Hospital"):ToAll()
local Coordinate=STATIC:FindByName("Hospital 2"):GetCoordinate()
H1=MARKER:New(Coordinate, "Hospital"):ToAll()
local Coordinate=STATIC:FindByName("Hospital 3"):GetCoordinate()
H1=MARKER:New(Coordinate, "Hospital"):ToAll()

Csar_Blue = MISSION
  :New( US_CC, "CSAR Missions", "Tactical", "Rescue downed pilots.", coalition.side.BLUE )

  BRGroups = SET_GROUP:New():FilterCoalitions( "blue" ):FilterPrefixes( "FARP Golan", "FARP Tyre", "Hussein" ):FilterStart()

  TaskDispatcher = TASK_CARGO_DISPATCHER:New( Csar_Blue, BRGroups )

  TaskDispatcher:StartCSARTasks( 
  "CSAR", 
  { ZONE_UNIT:New( "Hospital", STATIC:FindByName( "Hospital 1", "Hospital 2", "Hospital 3" ), 100 ) }, 
  "One of our pilots has ejected. Go out to Search and Rescue our pilot!\n" .. 
  "Use the radio menu to let the command center assist you with the CSAR tasking."
)

function TaskDispatcher:OnAfterCargoDeployed( From, Event, To, Task, TaskPrefix, TaskUnit, Cargo, DeployZone )

  MESSAGE:NewType( "Unit " .. TaskUnit:GetName().. " has deployed cargo " .. Cargo:GetName() .. " at zone " .. DeployZone:GetName() .. " for task " .. Task:GetName() .. ".", MESSAGE.Type.Information ):ToBlue()
  
end

--SEAD_SAM_Defenses = SEAD:New( { 'Sam-1', 'Sam-2', 'Sam-3', 'Sam-4', 'Sam-5', 'Sam-6', 'Sam-7', 'Sam-8', 'Sam-9', 'Sam-10', 'Sam-11', 'Sam-12' } )

Ship = GROUP:FindByName( "Naval-4", "Naval-2" )  
Ship:PatrolZones( { ZONE:New( "Patrol Area" ) }, 120, "Vee" )

DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "Recce" } )
DetectionSetGroup:FilterStart()
Detection = DETECTION_AREAS:New( DetectionSetGroup, 1000 )
A2GDispatcher = AI_A2G_DISPATCHER:New( Detection )

A2GDispatcher:AddDefenseCoordinate( "Defense", GROUP:FindByName( "DAB", "Homs", "Bei", "AB1" ):GetCoordinate() )

A2GDispatcher:SetDefenseRadius( 30000 )
A2GDispatcher:SetDefenseReactivityHigh()

A2GDispatcher:SetSquadron( "Al_DumayrCAS", AIRBASE.Syria.Al_Dumayr, { "S24", "S25", "M27", "K50" }, 300 )
A2GDispatcher:SetSquadronCas( "Al_DumayrCAS", 120, 250 )

PatrolZone = ZONE_POLYGON:New( "Recce", GROUP:FindByName( "Recce" ) )

A2GDispatcher:SetSquadron( "MezzehCAS", AIRBASE.Syria.Mezzeh, { "S24", "S25", "M27", "K50" }, 300 )
A2GDispatcher:SetSquadronCasPatrol( "MezzehCAS", PatrolZone, 300, 500, 50, 80, 250, 300 )
A2GDispatcher:SetSquadronPatrolInterval( "MezzehCAS", 2, 30, 60, 1, "CAS" )

A2GDispatcher:SetSquadron( "PalmyraCAS", AIRBASE.Syria.Palmyra, { "S24", "S25", "M27", "K50" }, 300 )
A2GDispatcher:SetSquadronSeadPatrol( "PalmyraCAS", PatrolZone, 300, 500, 50, 80, 250, 300 )
A2GDispatcher:SetSquadronPatrolInterval( "PalmyraCAS", 2, 30, 60, 1, "SEAD" )

A2GDispatcher:SetSquadron( "RayakCAS", AIRBASE.Syria.Rayak, { "S24", "S25", "M27", "K50" }, 300 )
A2GDispatcher:SetSquadronCas( "RayakCAS", 120, 250 )