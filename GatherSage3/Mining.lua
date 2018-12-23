local _, ns = ...

-----------------
-- Mining Data --
-----------------
ns.Name["Copper Vein"] = "Mining:1";
ns.Chance["Copper Vein"] = {'2770:100', '2835:79', '774:2', '818:2', '1210:2'};

ns.Name["Tin Vein"] = "Mining:50";
ns.Chance["Tin Vein"] = {'2771:100', '2836:80', '1206:3', '1210:2', '1705:2', '1529:0.96'};

ns.Name["Silver Vein"] = "Mining:55";
ns.Chance["Silver Vein"] = {'2775:100', '1206:4', '1705:3', '1210:2'};

ns.Name["Iron Deposit"] = "Mining:100";
ns.Chance["Iron Deposit"] = {'2772:100', '2838:100', '1529:4', '1705:3', '3864:3', '7909:1'};

ns.Name["Gold Vein"] = "Mining:115";
ns.Chance["Gold Vein"] = {'2776:100', '3864:3', '1529:2', '1705:2'};

ns.Name["Mithril Deposit"] = "Mining:150";
ns.Chance["Mithril Deposit"] = {'3858:100', '7912:79', '3864:3', '9262:3', '7909:2', '7910:2'};

ns.Name["Truesilver Deposit"] = "Mining:165";
ns.Chance["Truesilver Deposit"] = {'7911:100', '7909:4', '7910:2', '3864:2'};

ns.Name["Dark Iron Deposit"] = "Mining:175";
ns.Chance["Dark Iron Deposit"] = {'11370:100', '9262:1.08', '11382:1.05', '11754:0.5'};

ns.Name["Small Thorium Vein"] = "Mining:200";
ns.Chance["Small Thorium Vein"] = {'10620:100', '12365:100', '12363:8', '7910:2', '9262:2', '12799:2', '12361:2', '12800:2', '12364:2'};

ns.Name["Rich Thorium Vein"] = "Mining:215";
ns.Chance["Rich Thorium Vein"] = {'10620:100', '12365:100', '12363:13', '7910:4', '12799:3', '12361:3', '12800:3', '12364:2'};

--Outland
ns.Name["Fel Iron Deposit"] = "Mining:275";
ns.Chance["Fel Iron Deposit"] = {'23424:100', '22574:29', '22573:29', '35229:25', '23427:5', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 65)|r:0.37%', '|cff0070ddRare Gem|r |cffffd200(iLvl 70)|r:0.13%'};

ns.Name["Adamantite Deposit"] = "Mining:325";
ns.Chance["Adamantite Deposit"] = {'23425:100', '22573:30', '23427:30', '35229:25', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 65)|r:0.77%', '|cff0070ddRare Gem|r |cffffd200(iLvl 70)|r:0.26%'};

ns.Name["Rich Adamantite Deposit"] = "Mining:350";
ns.Chance["Rich Adamantite Deposit"] = {'23425:100', '22573:81', '23427:50', '35229:25', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 65)|r:1.66%', '|cff0070ddRare Gem|r |cffffd200(iLvl 70)|r:0.52%'};

ns.Name["Khorium Vein"] = "Mining:375";
ns.Chance["Khorium Vein"] = {'23426:100', '22573:100', '22574:100', '23427:30', '35229:25', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 65)|r:6%', '|cff0070ddRare Gem|r |cffffd200(iLvl 70)|r:2%'};

--Northrend
ns.Name["Cobalt Deposit"] = "Mining:350";
ns.Chance["Cobalt Deposit"] = {'36909:100', '37701:29', '37705:29', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 75)|r:0.5%', '|cff0070ddRare Gem|r |cffffd200(iLvl 80)|r:0.25%'};

ns.Name["Rich Cobalt Deposit"] = "Mining:375";
ns.Chance["Rich Cobalt Deposit"] = {'36909:100', '37705:65', '37701:64', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 75)|r:1.5%', '|cff0070ddRare Gem|r |cffffd200(iLvl 80)|r:0.8%'};

ns.Name["Saronite Deposit"] = "Mining:400";
ns.Chance["Saronite Deposit"] = {'36912:100', '37701:44', '37703:44', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 75)|r:0.50%', '|cff0070ddRare Gem|r |cffffd200(iLvl 80)|r:0.25%'};

ns.Name["Rich Saronite Deposit"] = "Mining:425";
ns.Chance["Rich Saronite Deposit"] = {'36912:100', '37701:50', '37703:50', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 75)|r:8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 80)|r:0.8%'};

ns.Name["Pure Saronite Deposit"] = "Mining:450";
ns.Chance["Pure Saronite Deposit"] = {'36912:100', '37701:50', '37703:50', '1-3x |cff1eff00Uncommon Gem|r  |cffffd200(iLvl 75)|r:~30%', '4-7x |cff0070ddRare Gem|r |cffffd200(iLvl 80)|r:~21%'};

ns.Name["Titanium Vein"] = "Mining:450";
ns.Chance["Titanium Vein"] = {'36910:100', '37700:50', '37701:51', '37702:50', '37705:50', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 75)|r:8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 80)|r:1.6%'};

--Cataclysm
ns.Name["Ancient Gem Vein"] = "Mining:375";
ns.Chance["Ancient Gem Vein"] = {'34907:100', '32227:18', '32230:18', '32228:18', '32229:17', '32231:17', '32249:17', '23437:10', '23436:10', '23440:9', '23441:9', '23439:9', '23438:8'};

ns.Name["Obsidium Deposit"] = "Mining:425";
ns.Chance["Obsidium Deposit"] = {'53038:100', '52327:9', '52328:3', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 81)|r:0.8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 85)|r:0.16%'};

ns.Name["Rich Obsidium Deposit"] = "Mining:450";
ns.Chance["Rich Obsidium Deposit"] = {'53038:100', '52327:19', '52328:3', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 81)|r:0.8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 85)|r:0.16%'};

ns.Name["Elementium Vein"] = "Mining:475";
ns.Chance["Elementium Vein"] = {'52185:100', '52325:9', '52327:9', '52326:9', '52328:3', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 81)|r:0.8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 85)|r:0.16%'};

ns.Name["Rich Elementium Vein"] = "Mining:500";
ns.Chance["Rich Elementium Vein"] = {'52185:100', '52325:19', '52327:19', '52326:19', '52328:3', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 81)|r:0.8%', '|cff0070ddRare Gem|r  |cffffd200(iLvl 85)|r:0.16%'};

ns.Name["Pyrite Deposit"] = "Mining:525";
ns.Chance["Pyrite Deposit"] = {'52183:100', '52325:10', '52328:3', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 81)|r:0.8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 85)|r:0.16%'};

ns.Name["Rich Pyrite Deposit"] = "Mining:525";
ns.Chance["Rich Pyrite Deposit"] = {'52183:100', '52325:19', '52328:3', '|cff1eff00Uncommon Gem|r |cffffd200(iLvl 81)|r:0.8%', '|cff0070ddRare Gem|r |cffffd200(iLvl 85)|r:0.16%'};
