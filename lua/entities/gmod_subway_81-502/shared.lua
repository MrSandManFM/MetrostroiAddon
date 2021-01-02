ENT.Type            = "anim"
ENT.Base            = "gmod_subway_base"

ENT.PrintName       = "Ema (81-502)"
ENT.Author          = ""
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "Metrostroi (trains)"
ENT.SkinsType = "81-502"
ENT.Model = "models/metrostroi_train/81-502/81-502.mdl"

ENT.Spawnable       = true
ENT.AdminSpawnable  = false
ENT.DontAccelerateSimulation = false

function ENT:PassengerCapacity()
    return 300
end

function ENT:GetStandingArea()
    return Vector(-450,-30,-55),Vector(380,30,-55)
end

local function GetDoorPosition(i,k)
    return Vector(359.0 - 35/2 - 229.5*i,-65*(1-2*k),7.5)
end

-- Setup door positions
ENT.LeftDoorPositions = {}
ENT.RightDoorPositions = {}
for i=0,3 do
    table.insert(ENT.LeftDoorPositions,GetDoorPosition(i,1))
    table.insert(ENT.RightDoorPositions,GetDoorPosition(i,0))
end

ENT.AnnouncerPositions = {
    {Vector(412,-49 ,61),80,0.6},
    {Vector(-3,-60, 62),300,0.6},
    {Vector(-3,60 ,62),300,0.6},
}

ENT.Cameras = {
    {Vector(407.5+18,32,21),Angle(0,180,0),"Train.703.Breakers1"},
    {Vector(407.5+18,50,24),Angle(5,180,0),"Train.703.Breakers2"},
    {Vector(407.5+20,-40,25),Angle(0,180,0),"Train.502.AV"},
    {Vector(407.5+10,-35,9),Angle(20,180,0),"Train.502.VBA","VBA"},
    {Vector(407.5+10,-28,5),Angle(20,180,0),"Train.502.VRD","VRD"},
    {Vector(407.5+13,-46,10),Angle(10,200,0),"Train.502.RCARS","RCARS"},
    {Vector(407.5+13,-46,10),Angle(10,200,0),"Train.502.RCAV5","RCAV5"},
    {Vector(407.5+3,-37,-20),Angle(-20,180+40,0),"Train.502.RCBPS","RCBPS"},
    {Vector(407.5+3,-37,-20),Angle(-20,180+40,0),"Train.502.RCAV3","RCAV3"},
    {Vector(407.5+3,-33,-20),Angle(-20,180-40,0),"Train.502.RCAV4","RCAV4"},
    {Vector(407.5+34,48,16),Angle(0,37,0),"Train.Common.HelpersPanel"},
    {Vector(407.5+30,40,5) ,Angle(30,10,0),"Train.703.Parking"},
    {Vector(407.5+75,48,1),Angle(0,190,0),"Train.Common.RouteNumber"},
    {Vector(450+13,0,26),Angle(60,0,0),"Train.Common.CouplerCamera"},
}

function ENT:InitializeSounds()
    self.BaseClass.InitializeSounds(self)
    self.SoundNames["rolling_5"] = {loop=true,"subway_trains/common/junk/junk_background3.wav"}
    self.SoundNames["rolling_10"] = {loop=true,"subway_trains/717/rolling/10_rolling.wav"}
    self.SoundNames["rolling_40"] = {loop=true,"subway_trains/717/rolling/40_rolling.wav"}
    self.SoundNames["rolling_70"] = {loop=true,"subway_trains/717/rolling/70_rolling.wav"}
    self.SoundNames["rolling_80"] = {loop=true,"subway_trains/717/rolling/80_rolling.wav"}
    self.SoundPositions["rolling_5"] = {480,1e12,Vector(0,0,0),0.15}
    self.SoundPositions["rolling_10"] = {480,1e12,Vector(0,0,0),0.20}
    self.SoundPositions["rolling_40"] = {480,1e12,Vector(0,0,0),0.55}
    self.SoundPositions["rolling_70"] = {480,1e12,Vector(0,0,0),0.60}
    self.SoundPositions["rolling_80"] = {480,1e12,Vector(0,0,0),0.75}

    self.SoundNames["rolling_motors"] = {loop=true,"subway_trains/ezh/rolling/rolling_motors.wav"}
    self.SoundPositions["rolling_motors"] = {480,1e12,Vector(0,0,0),.4}

    self.SoundNames["rolling_low"] = {loop=true,"subway_trains/717/rolling/rolling_outside_low.wav"}
    self.SoundNames["rolling_medium1"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium1.wav"}
    self.SoundNames["rolling_medium2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium2.wav"}
    self.SoundNames["rolling_high2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_high2.wav"}
    self.SoundPositions["rolling_low"] = {480,1e12,Vector(0,0,0),0.6}
    self.SoundPositions["rolling_medium1"] = {480,1e12,Vector(0,0,0),0.90}
    self.SoundPositions["rolling_medium2"] = {480,1e12,Vector(0,0,0),0.90}
    self.SoundPositions["rolling_high2"] = {480,1e12,Vector(0,0,0),1.00}

    self.SoundNames["pneumo_disconnect2"] = "subway_trains/common/pneumatic/pneumo_close.mp3"
    self.SoundNames["pneumo_disconnect1"] = {
        "subway_trains/common/pneumatic/pneumo_open.mp3",
        "subway_trains/common/pneumatic/pneumo_open2.mp3",
    }
    self.SoundPositions["pneumo_disconnect2"] = {60,1e9,Vector(431.8,-50.1+1.5,-33.7),1}
    self.SoundPositions["pneumo_disconnect1"] = {60,1e9,Vector(431.8,-50.1+1.5,-33.7),1}

    -- Релюшки
    self.SoundNames["rpb_off"] = "subway_trains/717/relays/lsd_2.mp3"
    self.SoundNames["rpb_on"] = "subway_trains/717/relays/relay_on.mp3"
    self.SoundPositions["rpb_on"] = {100,1e9,Vector(400,25,-35),1}
    self.SoundPositions["rpb_off"] = {100,1e9,Vector(400,25,-35),1}

    self.SoundNames["kd_off"] = "subway_trains/717/relays/lsd_2.mp3"
    self.SoundNames["kd_on"] = "subway_trains/717/relays/new/kd_on.mp3"
    self.SoundPositions["kd_on"] = {100,1e9,Vector(400,25,-35),1}
    self.SoundPositions["kd_off"] = {100,1e9,Vector(400,25,-35),1}

    self.SoundNames["avu_off"] = "subway_trains/common/pneumatic/ak11b_off.mp3"
    self.SoundNames["avu_on"] = "subway_trains/common/pneumatic/ak11b_on.mp3"
    self.SoundPositions["avu_on"] = {60,1e9, Vector(400,-40,-45),0.5}
    self.SoundPositions["avu_off"] = {60,1e9, Vector(400,-40,-45),0.5}
    --Подвагонка
    self.SoundNames["lk2_on"] = "subway_trains/717/pneumo/lk1_on.mp3"
    self.SoundNames["lk2_off"] = "subway_trains/717/pneumo/lk2_off.mp3"
    self.SoundNames["lk5_on"] = "subway_trains/717/pneumo/lk2_on.mp3"
    self.SoundNames["lk5_off"] = "subway_trains/717/pneumo/lk2_off.mp3"
    self.SoundNames["lk4_on"] = "subway_trains/717/pneumo/lk3_on.mp3"
    self.SoundNames["lk4_off"] = "subway_trains/717/pneumo/lk3_off.mp3"
    self.SoundPositions["lk2_on"] = {440,1e9,Vector(-60,-40,-66),0.22}
    self.SoundPositions["lk2_off"] = {440,1e9,Vector(-60,-40,-66),0.3}
    self.SoundPositions["lk5_on"] = self.SoundPositions["lk2_on"]
    self.SoundPositions["lk5_off"] = self.SoundPositions["lk2_off"]
    self.SoundPositions["lk4_on"] = self.SoundPositions["lk2_on"]
    self.SoundPositions["lk4_off"] = self.SoundPositions["lk2_off"]

    self.SoundNames["compressor"] = {loop=1.79,"subway_trains/717/compressor/compressor_717_start2.wav","subway_trains/717/compressor/compressor_717_loop2.wav", "subway_trains/717/compressor/compressor_717_stop2.wav"}
    self.SoundPositions["compressor"] = {485,1e9,Vector(-118,-40,-66),0.80}
    self.SoundNames["compressor_reflection"] = {"subway_trains/common/junk/junk_background2.wav"}
    self.SoundPositions["compressor_reflection"] = {150,1e9,Vector(300,0,0)}
    self.SoundPositions["compressor_reflection"] = {150,1e9,Vector(-300,0,0)}
    self.SoundNames["rk"] = {"subway_trains/ezh/rk/rk_start.wav","subway_trains/ezh/rk/rk_spin.wav","subway_trains/ezh/rk/rk_stop.wav"}
    self.SoundPositions["rk"] = {50,1e9,Vector(110,-40,-75),0.22}

    self.SoundNames["ezh3_revers_0-f"] = {"subway_trains/717/kv70/reverser_0-f_1.mp3","subway_trains/717/kv70/reverser_0-f_2.mp3"}
    self.SoundNames["ezh3_revers_f-0"] = {"subway_trains/717/kv70/reverser_f-0_1.mp3","subway_trains/717/kv70/reverser_f-0_2.mp3"}
    self.SoundNames["ezh3_revers_0-b"] = {"subway_trains/717/kv70/reverser_0-b_1.mp3","subway_trains/717/kv70/reverser_0-b_2.mp3"}
    self.SoundNames["ezh3_revers_b-0"] = {"subway_trains/717/kv70/reverser_b-0_1.mp3","subway_trains/717/kv70/reverser_b-0_2.mp3"}
    self.SoundNames["revers_in"] = {"subway_trains/ezh3/kv66/revers_in.mp3"}
    self.SoundNames["revers_out"] = {"subway_trains/ezh3/kv66/revers_out.mp3"}
    self.SoundNames["rcu_in"] = {"subway_trains/ezh3/kv66/revers_in.mp3"}
    self.SoundNames["rcu_out"] = {"subway_trains/ezh3/kv66/revers_out.mp3"}
    self.SoundNames["rcu_on"] = {"subway_trains/ezh3/kv66/rcu_on.mp3","subway_trains/ezh3/kv66/rcu_on2.mp3"}
    self.SoundNames["rcu_off"] = "subway_trains/ezh3/kv66/rcu_off.mp3"
    self.SoundPositions["ezh3_revers_0-f"] = {80,1e9,Vector(458.00,-23,-6.40)}
    self.SoundPositions["ezh3_revers_f-0"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["ezh3_revers_0-b"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["ezh3_revers_b-0"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["revers_in"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["revers_out"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["rcu_on"] = self.SoundPositions["ezh3_revers_0-f"]
    self.SoundPositions["rcu_off"] = self.SoundPositions["rcu_on"]
    self.SoundPositions["rcu_in"] = self.SoundPositions["rcu_on"]
    self.SoundPositions["rcu_out"] = self.SoundPositions["rcu_on"]

    self.SoundNames["kr_left"] = "subway_trains/ezh3/controller/krishechka_left.mp3"
    self.SoundNames["kr_right"] = "subway_trains/ezh3/controller/krishechka_right.mp3"

    self.SoundNames["switch_off"] = {
        "subway_trains/717/switches/tumbler_slim_off1.mp3",
        "subway_trains/717/switches/tumbler_slim_off2.mp3",
        "subway_trains/717/switches/tumbler_slim_off3.mp3",
        "subway_trains/717/switches/tumbler_slim_off4.mp3",
    }
    self.SoundNames["switch_on"] = {
        "subway_trains/717/switches/tumbler_slim_on1.mp3",
        "subway_trains/717/switches/tumbler_slim_on2.mp3",
        "subway_trains/717/switches/tumbler_slim_on3.mp3",
        "subway_trains/717/switches/tumbler_slim_on4.mp3",
    }

    self.SoundNames["switchbl_off"] = {
        "subway_trains/717/switches/tumbler_fatb_off1.mp3",
        "subway_trains/717/switches/tumbler_fatb_off2.mp3",
        "subway_trains/717/switches/tumbler_fatb_off3.mp3",
    }
    self.SoundNames["switchbl_on"] = {
        "subway_trains/717/switches/tumbler_fatb_on1.mp3",
        "subway_trains/717/switches/tumbler_fatb_on2.mp3",
        "subway_trains/717/switches/tumbler_fatb_on3.mp3",
    }

    self.SoundNames["button1_off"] = {
        "subway_trains/ezh3/switches/button_off1.mp3",
        "subway_trains/ezh3/switches/button_off2.mp3",
    }
    self.SoundNames["button1_on"] = {
        "subway_trains/ezh3/switches/button_on1.mp3",
        "subway_trains/ezh3/switches/button_on2.mp3",
    }
    self.SoundNames["button2_off"] = {
        "subway_trains/ezh3/switches/button_off3.mp3",
        "subway_trains/ezh3/switches/button_off4.mp3",
    }
    self.SoundNames["button2_on"] = {
        "subway_trains/ezh3/switches/button_on3.mp3",
        "subway_trains/ezh3/switches/button_on4.mp3",
    }
    self.SoundNames["button3_off"] = {
        "subway_trains/ezh3/switches/button_off6.mp3",
        "subway_trains/ezh3/switches/button_off5.mp3",
    }
    self.SoundNames["button3_on"] = {
        "subway_trains/ezh3/switches/button_on5.mp3",
        "subway_trains/ezh3/switches/button_on6.mp3",
    }

    self.SoundNames["uava_reset"] = {
        "subway_trains/common/uava/uava_reset1.mp3",
        "subway_trains/common/uava/uava_reset2.mp3",
        "subway_trains/common/uava/uava_reset4.mp3",
    }
    self.SoundPositions["uava_reset"] = {80,1e9,Vector(449+7.7,56.0,-10.24349),0.6}
    self.SoundNames["gv_f"] = {"subway_trains/ezh3/kv66/rcu_on.mp3","subway_trains/ezh3/kv66/rcu_on2.mp3"}
    self.SoundNames["gv_b"] = "subway_trains/ezh3/kv66/rcu_off.mp3"
    self.SoundPositions["gv_f"]     = {80,1e2,Vector(120,62.0+0.0,-60),0.5}
    self.SoundPositions["gv_b"]     = {80,1e2,Vector(120,62.0+0.0,-60),0.5}

    self.SoundNames["disconnect_valve"] = "subway_trains/common/switches/pneumo_disconnect_switch.mp3"



     self.SoundNames["kv70_fix_on"] = {"subway_trains/717/kv70/kv70_fix_on1.mp3","subway_trains/717/kv70/kv70_fix_on2.mp3"}
    self.SoundNames["kv70_fix_off"] = {"subway_trains/717/kv70/kv70_fix_off1.mp3","subway_trains/717/kv70/kv70_fix_off2.mp3"}
    self.SoundNames["kv40_0_t1"] = {"subway_trains/ezh/kv40_2/0_t1.mp3"}
    self.SoundNames["kv40_t1_0"] = {"subway_trains/ezh/kv40_2/t1_0.mp3"}
    self.SoundNames["kv40_t1_t1a"] = {"subway_trains/ezh/kv40_2/t1_t1a.mp3"}
    self.SoundNames["kv40_t1a_t1"] = {"subway_trains/ezh/kv40_2/t1a_t1.mp3"}
    self.SoundNames["kv40_t1a_t2"] = {"subway_trains/ezh/kv40_2/t1a_t2.mp3"}
    self.SoundNames["kv40_t2_t1a"] = {"subway_trains/ezh/kv40_2/t2_t1a.mp3"}
    self.SoundNames["kv40_0_x1"] = {"subway_trains/ezh/kv40_2/0_x1_2.mp3"}
    self.SoundNames["kv40_x1_0"] = {"subway_trains/ezh/kv40_2/x1_0.mp3"}
    self.SoundNames["kv40_x1_x2"] = {"subway_trains/ezh/kv40_2/x1_x2.mp3"}
    self.SoundNames["kv40_x2_x1"] = {"subway_trains/ezh/kv40_2/x2_x1.mp3"}
    self.SoundNames["kv40_x2_x3"] = {"subway_trains/ezh/kv40_2/x2_x3.mp3"}
    self.SoundNames["kv40_x3_x2"] = {"subway_trains/ezh/kv40_2/x3_x2.mp3"}
    self.SoundPositions["kv70_fix_on"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv70_fix_off"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_0_t1"] = 		{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv70_t1_0_fix"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_t1_0"] = 		{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_t1_t1a"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_t1a_t1"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_t1a_t2"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_t2_t1a"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_0_x1"] = 		{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_x1_0"] = 		{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_x1_x2"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_x2_x1"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_x2_x3"] = 	{100,1e9,Vector(458.00,-23,-6),1}
    self.SoundPositions["kv40_x3_x2"] = 	{100,1e9,Vector(458.00,-23,-6),1}

    self.SoundNames["rcav_0-2"] = {"subway_trains/ezh3/rc_ars/0-2.mp3"}
    self.SoundNames["rcav_2-0"] = {"subway_trains/ezh3/rc_ars/2-0.mp3"}

    self.SoundNames["ring"] = {loop=0.05,"subway_trains/502/ring_ksaup.wav"}
    self.SoundPositions["ring"] = {120,1e9,Vector(410,-40,35),0.35}

    self.SoundNames["ring2"] = {"subway_trains/717/ring/ring_start.wav","subway_trains/717/ring/ring_loop.wav","subway_trains/717/ring/ring_end.wav"}
    self.SoundPositions["ring2"] = self.SoundPositions["ring"]

    self.SoundNames["vpr"] = {loop=0.8,"subway_trains/common/other/radio/vpr_start.wav","subway_trains/common/other/radio/vpr_loop.wav","subway_trains/common/other/radio/vpr_off.wav"}
    self.SoundPositions["vpr"] = {60,1e9,Vector(412,-49 ,61),0.05}

    self.SoundNames["cab_door_open"] = "subway_trains/common/door/cab/door_open.mp3"
    self.SoundNames["cab_door_close"] = "subway_trains/common/door/cab/door_close.mp3"

   self.SoundNames["parking_brake_rolling"] = {"subway_trains/ezh3/parking_brake_rolling1.mp3","subway_trains/ezh3/parking_brake_rolling2.mp3","subway_trains/ezh3/parking_brake_rolling3.mp3","subway_trains/ezh3/parking_brake_rolling4.mp3"}
    self.SoundPositions["parking_brake_rolling"] = {65,1e9,Vector(449.118378+7.6,33.493385,-14.713276),0.1}
    self.SoundNames["av8_on"] = {"subway_trains/common/switches/av8/av8_on.mp3","subway_trains/common/switches/av8/av8_on2.mp3"}
    self.SoundNames["av8_off"] = {"subway_trains/common/switches/av8/av8_off.mp3","subway_trains/common/switches/av8/av8_off2.mp3"}
    self.SoundPositions["av8_on"] = {100,1e9,Vector(405,40,30)}
    self.SoundPositions["av8_off"] = {100,1e9,Vector(405,40,30)}

    self.SoundNames["vu22_on"] = {"subway_trains/ezh3/vu/vu22_on1.mp3", "subway_trains/ezh3/vu/vu22_on2.mp3", "subway_trains/ezh3/vu/vu22_on3.mp3"}
    self.SoundNames["vu22_off"] = {"subway_trains/ezh3/vu/vu22_off1.mp3", "subway_trains/ezh3/vu/vu22_off2.mp3", "subway_trains/ezh3/vu/vu22_off3.mp3"}
    self.SoundNames["vu223_on"] = {"subway_trains/common/switches/vu22/vu22_3_on.mp3"}
    self.SoundNames["vu223_off"] = {"subway_trains/common/switches/vu22/vu22_3_off.mp3"}

    --Краны
 --Краны
    self.SoundNames["brake_f"] = {"subway_trains/common/pneumatic/vz_brake_on2.mp3","subway_trains/common/pneumatic/vz_brake_on3.mp3","subway_trains/common/pneumatic/vz_brake_on4.mp3"}
    self.SoundPositions["brake_f"] = {50,1e9,Vector(317-8,0,-82),0.13}
    self.SoundNames["brake_b"] = self.SoundNames["brake_f"]
    self.SoundPositions["brake_b"] = {50,1e9,Vector(-317+0,0,-82),0.13}
    self.SoundNames["release1"] = {loop=true,"subway_trains/common/pneumatic/release_0.wav"}
    self.SoundPositions["release1"] = {350,1e9,Vector(-183,0,-70),1}
    self.SoundNames["release2"] = {loop=true,"subway_trains/common/pneumatic/release_low.wav"}
    self.SoundPositions["release2"] = {350,1e9,Vector(-183,0,-70),0.4}

    self.SoundNames["front_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["front_isolation"] = {300,1e9,Vector(452, 0,-63),1}
    self.SoundNames["rear_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["rear_isolation"] = {300,1e9,Vector(-456, 0,-63),1}

    self.SoundNames["crane013_brake2"] = {loop=true,"subway_trains/common/pneumatic/013_brake2.wav"}
    self.SoundPositions["crane013_brake2"] = {80,1e9,Vector(456.55,-52.55,-4.5),0.86}
    self.SoundNames["crane334_brake_high"] = {loop=true,"subway_trains/common/pneumatic/334_brake.wav"}
    self.SoundPositions["crane334_brake_high"] = {80,1e9,Vector(456.55,-52.55,-4.5),0.85}
    self.SoundNames["crane334_brake_low"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow.wav"}
    self.SoundPositions["crane334_brake_low"] = {80,1e9,Vector(456.55,-52.55,-4.5),0.75}
    self.SoundNames["crane334_brake_2"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow.wav"}
    self.SoundPositions["crane334_brake_2"] = {80,1e9,Vector(456.55,-52.55,-4.5),0.85}
    self.SoundNames["crane334_brake_eq_high"] = {loop=true,"subway_trains/common/pneumatic/334_release_reservuar.wav"}
    self.SoundPositions["crane334_brake_eq_high"] = {80,1e9,Vector(456.55,-52.55,-70),0.45}
    self.SoundNames["crane334_brake_eq_low"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow2.wav"}
    self.SoundPositions["crane334_brake_eq_low"] = {80,1e9,Vector(456.55,-52.55,-70),0.45}
    self.SoundNames["crane334_release"] = {loop=true,"subway_trains/common/pneumatic/334_release3.wav"}
    self.SoundPositions["crane334_release"] = {80,1e9,Vector(456.55,-52.55,-4.5),0.2}
    self.SoundNames["crane334_release_2"] = {loop=true,"subway_trains/common/pneumatic/334_release2.wav"}
    self.SoundPositions["crane334_release_2"] = {80,1e9,Vector(456.55,-52.55,-4.5),0.2}

    self.SoundNames["valve_brake"] = {loop=true,"subway_trains/common/pneumatic/epv_loop.wav"}
    self.SoundPositions["valve_brake"] = {400,1e9,Vector(464.40,24.4,-50),1}

    --self.SoundNames["emer_brake"] = {loop=0.8,"subway_trains/common/pneumatic/autostop_start.wav","subway_trains/common/pneumatic/autostop_loop.wav", "subway_trains/common/pneumatic/autostop_end.wav"}
    self.SoundNames["emer_brake"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop.wav"}
    self.SoundNames["emer_brake2"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop_2.wav"}
    self.SoundPositions["emer_brake"] = {600,1e9,Vector(380,-65,-75)}
    self.SoundPositions["emer_brake2"] = self.SoundPositions["emer_brake"]

    self.SoundNames["pneumo_TL_open"] = {
        "subway_trains/common/334/334_open.mp3",
    }
    self.SoundNames["pneumo_TL_open_background"] = {
        "subway_trains/common/334/334_open_pipeinside.mp3",
    }
    self.SoundPositions["pneumo_TL_open_background"] = {180,1e9,Vector(456.55,-52.57,-55),0.2}

    self.SoundNames["pneumo_TL_disconnect"] = {
        "subway_trains/common/334/334_close.mp3",
    }
    self.SoundNames["pneumo_BL_disconnect"] = {
        "subway_trains/common/334/334_close.mp3",
    }

    self.SoundNames["horn"] = {loop=0.8,"subway_trains/common/pneumatic/horn/horn3_start.wav","subway_trains/common/pneumatic/horn/horn3_loop.wav", "subway_trains/common/pneumatic/horn/horn3_end.wav"}
    self.SoundPositions["horn"] = {1100,1e9,Vector(450,-20,-55)}

    --DOORS
    self.SoundNames["vdol_on"] = {
        "subway_trains/common/pneumatic/door_valve/VDO_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDO2_on.mp3",
    }
    self.SoundNames["vdol_off"] = {
        "subway_trains/common/pneumatic/door_valve/VDO_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDO2_off.mp3",
    }
    self.SoundPositions["vdol_on"] = {100,1e9,Vector(410,20,-45)}
    self.SoundPositions["vdol_off"] = {100,1e9,Vector(410,20,-45)}
    self.SoundNames["vdor_on"] = self.SoundNames["vdol_on"]
    self.SoundNames["vdor_off"] = self.SoundNames["vdol_off"]
    self.SoundPositions["vdor_on"] = self.SoundPositions["vdol_on"]
    self.SoundPositions["vdor_off"] = self.SoundPositions["vdol_off"]
    self.SoundNames["vdz_on"] = {
        "subway_trains/common/pneumatic/door_valve/VDZ_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ2_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ3_on.mp3",
    }
    self.SoundNames["vdz_off"] = {
        "subway_trains/common/pneumatic/door_valve/VDZ_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ2_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ3_off.mp3",
    }
    self.SoundPositions["vdz_on"] = {100,1e9,Vector(410,20,-45)}
    self.SoundPositions["vdz_off"] = {100,1e9,Vector(410,20,-45)}

    self.SoundNames["kk_off"] = "subway_trains/common/pneumatic/ak11b_off2.mp3"
    self.SoundNames["kk_on"] = "subway_trains/common/pneumatic/ak11b_on2.mp3"
    self.SoundPositions["kk_on"] = {100,1e9,Vector(407,-55,-5),0.3}
    self.SoundPositions["kk_off"] = {100,1e9,Vector(407,-55,-5),0.3}
    for i=0,3 do
        for k=0,1 do
            self.SoundNames["door"..i.."x"..k.."r"] = {"subway_trains/common/door/door_roll.wav",loop=true}
            self.SoundPositions["door"..i.."x"..k.."r"] = {150,1e9,GetDoorPosition(i,k),0.11}
            self.SoundNames["door"..i.."x"..k.."o"] = {"subway_trains/common/door/door_open_end5.mp3","subway_trains/common/door/door_open_end6.mp3","subway_trains/common/door/door_open_end7.mp3"}
            self.SoundPositions["door"..i.."x"..k.."o"] = {350,1e9,GetDoorPosition(i,k),2}
            self.SoundNames["door"..i.."x"..k.."c"] = {"subway_trains/common/door/door_close_end.mp3","subway_trains/common/door/door_close_end2.mp3","subway_trains/common/door/door_close_end3.mp3","subway_trains/common/door/door_close_end4.mp3","subway_trains/common/door/door_close_end5.mp3"}
            self.SoundPositions["door"..i.."x"..k.."c"] = {400,1e9,GetDoorPosition(i,k),2}
        end
    end
    for k,v in ipairs(self.AnnouncerPositions) do
        self.SoundNames["announcer_noise1_"..k] = {loop=true,"subway_announcers/upo/noiseS1.wav"}
        self.SoundPositions["announcer_noise1_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
        self.SoundNames["announcer_noise2_"..k] = {loop=true,"subway_announcers/upo/noiseS2.wav"}
        self.SoundPositions["announcer_noise2_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
        self.SoundNames["announcer_noise3_"..k] = {loop=true,"subway_announcers/upo/noiseS3.wav"}
        self.SoundPositions["announcer_noise3_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
        self.SoundNames["announcer_noiseW"..k] = {loop=true,"subway_announcers/upo/noiseW.wav"}
        self.SoundPositions["announcer_noiseW"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
    end

    self.SoundNames["RKR"] = "subway_trains/common/pneumatic/rkr2.mp3"
    self.SoundPositions["RKR"] = {330,1e9,Vector(-27,-40,-66),0.22}
    self.SoundNames["PN2end"] = {"subway_trains/common/pneumatic/vz2_end.mp3","subway_trains/common/pneumatic/vz2_end_2.mp3","subway_trains/common/pneumatic/vz2_end_3.mp3","subway_trains/common/pneumatic/vz2_end_4.mp3"}
    self.SoundPositions["PN2end"] = {350,1e9,Vector(-183,0,-70),0.3}
end

function ENT:InitializeSystems()

    -- Электросистема Е (АРС)
    self:LoadSystem("Electric","81_502_Electric")
    self.Electric:TriggerInput("Type",self.Electric.NVL)

    -- Токоприёмник
    self:LoadSystem("TR","TR_3B")
    -- Электротяговые двигатели
    self:LoadSystem("Engines","DK_108D")

    -- Резисторы для реостата/пусковых сопротивлений
    self:LoadSystem("KF_47A","81_703_KF_47A")
    -- Резисторы для ослабления возбуждения
    self:LoadSystem("KF_50A")
    -- Ящик с предохранителями
    self:LoadSystem("YAP_57")

    -- Резисторы для цепей управления
    --self:LoadSystem("YAS_44V")
    self:LoadSystem("Reverser","PR_722D")
    -- Реостатный контроллер для управления пусковыми сопротивления
    self:LoadSystem("RheostatController","EKG_17A")
    -- Групповой переключатель положений
    self:LoadSystem("PositionSwitch","EKG_18A")
    -- Кулачковый контроллер
    self:LoadSystem("KV","KV_55")
    -- Панель резервного управления
    self:LoadSystem("PRU_502")


    -- Ящики с реле и контакторами
    self:LoadSystem("LK_755A")
    self:LoadSystem("YAR_13A")
    --self:LoadSystem("YAR_27")
    self:LoadSystem("YAK_36")
    self:LoadSystem("YAK_31A")
    self:LoadSystem("YAS_44V")
    self:LoadSystem("YARD_2")
    self:LoadSystem("PR_109A")

    -- Пневмосистема 81-703
    self:LoadSystem("Pneumatic","81_703_Pneumatic")
    self:LoadSystem("BD2","Relay","")
    -- Панель управления Е
    self:LoadSystem("Panel","81_502_Panel")
    -- Everything else
    self:LoadSystem("Battery")
    self:LoadSystem("Horn")

    self:LoadSystem("Announcer","81_71_Announcer", "AnnouncementsUPO")
    self:LoadSystem("UPO","81_71_UPO")

    self:LoadSystem("ALSCoil")
    self:LoadSystem("KSAUP","81_502_KSAUP")
    self:LoadSystem("IPAV")
    self:LoadSystem("MARS","81_502_ARS")
    self:LoadSystem("BPS","81_502_BPS")

    self:LoadSystem("RouteNumber","81_71_RouteNumber",3)

    --self:LoadSystem("ALS_ARS","ARS_MP")

    --self:LoadSystem("IGLA_CBKI","IGLA_CBKI2")
    --self:LoadSystem("IGLA_PCBK")
end

function ENT:PostInitializeSystems()
    self.Electric:TriggerInput("Type",self.Electric.NVL)
    if SERVER and (not Metrostroi.MapHasFullSupport or not Metrostroi.MapHasFullSupport("auto")) then
        self.KSAUP:TriggerInput("CommandDoorsLeft",1)
        self.KSAUP:TriggerInput("CommandDoorsRight",1)
    end
end

ENT.SubwayTrain = {
    Type = "E",
    Name = "Ema",
    Manufacturer = "LVZ",
    WagType = 0,
    ALS = {
        NoEPK = true,
        HaveAutostop = true,
        TwoToSix = false,
        RSAs325Hz = false,
        Aproove0As325Hz = true,
    },
    IPAV = {
        Systems = {"KSAUP"}
    },
    EKKType = 703,
    NoFrontEKK=true,
}
ENT.NumberRanges = {{6047,6353}}
---[[
ENT.Spawner = {
    model = {
        "models/metrostroi_train/81-502/81-502.mdl",
        "models/metrostroi_train/81-502/ema_salon.mdl",
        "models/metrostroi_train/81-502/mirrors_ema.mdl",
        "models/metrostroi_train/81-502/ema502_cabine.mdl",
        "models/metrostroi_train/81-502/sun_protectors.mdl",
        "models/metrostroi_train/81-502/controller_a.mdl",
        "models/metrostroi_train/81-502/panel_b.mdl",
        {"models/metrostroi_train/81-508/81-508_underwagon.mdl",pos=Vector(0,1,-18)}
    },
    spawnfunc = function(i,tbls,tblt)
        local WagNum = tbls.WagNum
        if tbls.EWagons and i==1 then
            tbls.EID = 2+math.floor(math.random()*(WagNum-2))
        end
        if 1<i and i<WagNum  then
            return (tbls.EWagons and tbls.EMAType>1 and (tbls.EID==i or math.random()>0.9)) and "gmod_subway_81-703_int" or "gmod_subway_81-501"
        else
            return "gmod_subway_81-502"
        end
    end,
    interim = "gmod_subway_81-501",
    func = function(ent,i,maxi)
        if ent:GetClass() == "gmod_subway_81-502" then
            ent.VU:TriggerInput("Set",1)
            ent.UAVA:TriggerInput("Set",0)
            ent.Plombs.VU = nil
            ent.Plombs.UAVA = true
        else
            ent.VU:TriggerInput("Set",0)
            ent.UAVA:TriggerInput("Set",1)
            ent.Plombs.VU = true
            ent.Plombs.UAVA = nil
        end
    end,
    Metrostroi.Skins.GetTable("Texture","Texture",Texture,"train"),
    Metrostroi.Skins.GetTable("PassTexture","PassTexture",PassTexture,"pass"),
    Metrostroi.Skins.GetTable("CabTexture","CabTexture",CabTexture,"cab"),
    {"EMAType","Spawner.502.EMAType","List",{"Spawner.502.EMAType.NVL","Spawner.502.EMAType.KVLOld","Spawner.502.EMAType.KVLNew"},nil,function(ent,val,rot)
        if ent:GetClass():find("703") then
            -- Cross connections in train wires
            ent.TrainWireInverts = {
                [15] = true,
            }
            ent:SetNW2String("Texture","Def_703SPB")
        end
        if val == 1 then ent.Electric:TriggerInput("Type",ent.Electric.NVL) end
        if val > 1 then ent.Electric:TriggerInput("Type",ent.Electric.KVL) end
        ent.EMAType = val
        ent:SetNW2Int("EMAType",ent.EMAType)
    end},
    {"SpawnMode","Spawner.Common.SpawnMode","List",{"Spawner.Common.SpawnMode.Full","Spawner.Common.SpawnMode.Deadlock","Spawner.Common.SpawnMode.NightDeadlock","Spawner.Common.SpawnMode.Depot"}, nil,function(ent,val,rot,i,wagnum,rclk)
        if rclk then return end
        if ent._SpawnerStarted~=val then
            ent.VB:TriggerInput("Set",val<=2 and 1 or 0)
            ent.AV:TriggerInput("Set",val<=2 and 1 or 0)
            if ent.KSAUP  then
                local first = i==1 or _LastSpawner~=CurTime()

                ent.VU2:TriggerInput("Set",(val<=2 and first) and 1 or 0)
                --ent.VR:TriggerInput("Set",val<=2 and 1 or 0)
                ent.R_UPO:TriggerInput("Set",val<=2 and 1 or 0)
                ent.VMK:TriggerInput("Set",(val==1 and first) and 1 or 0)
                ent.ARS:TriggerInput("Set",(val==1 and ent.Plombs.RCARS) and 1 or 0)
                ent.VBA:TriggerInput("Set",(val==1 and ent.Plombs.RCAV3) and 1 or 0)
                ent.ALS:TriggerInput("Set",val==1 and 1 or 0)
                ent.VKF:TriggerInput("Set",val==3 and 1 or 0)
                ent.VSOSD:TriggerInput("Set",(val==1 and first) and 1 or 0)
                ent.Headlights:TriggerInput("Set",val==1 and 1 or 0)
                _LastSpawner=CurTime()
                ent.CabinDoor = val==4 and first
                ent.PassengerDoor = val==4
                ent.RearDoor = val==4
            else
                ent.VU2:TriggerInput("Set",0)
                ent.FrontDoor = val==4
                ent.RearDoor = val==4
            end
            ent.GV:TriggerInput("Set",val<4 and 1 or 0)
            ent._SpawnerStarted = val
        end
        if val==1 then ent.KO:TriggerInput("Close",1) else ent.KO:TriggerInput("Open",1) end
        ent.Pneumatic.TrainLinePressure = val==3 and math.random()*4 or val==2 and 4.5+math.random()*3 or 7.6+math.random()*0.6
        if val==4 then ent.Pneumatic.BrakeLinePressure = 5.2 end
    end},
    {"EWagons","Spawner.502.EWagons","Boolean"},
}
--]]