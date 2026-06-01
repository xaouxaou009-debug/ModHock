local SchoolManager = CS.Wnd_Simple.CreateWindow("SchoolManager")
ModifierMain:AddWindow("SchoolManager",SchoolManager)
function SchoolManager:OnInit()
	self.SchoolTangManager = ModifierMain:FindWindow("SchoolTangManager")
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Sect modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)

	local sy=1.5
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Cuurent sect: My Sect",self.sx/10,self.sy/10*sy,300,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable3111","Sect ID:",self.sx/10,self.sy/10*sy,200,35)
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*sy)
	self.inputid1:SetSize(self.sx/10, 25, false)
	self.inputid1.m_title.restrict = "[0-9]"
	self.inputid1.m_title.maxLength = 3
	QFWDModifierMainUI:AddButton2(self,"bntUpdataSchoolAttribute","My Sect",self.sx/10*4,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntChooseSchool","Select",self.sx/10*3,self.sy/10*sy):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowAllSchool","All sects",self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	
	QFWDModifierMainUI:AddButton2(self,"bntRemoveSchool","Remove Sect",self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	
	sy=sy+0.5
	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute","Current attribute: None",self.sx/10*1,self.sy/10*sy,300,35)
	self.ShowLableAttribute:SetSize(self.sx/10*5, 25, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable3","Attribute ID:",self.sx/10*1,self.sy/10*sy,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*sy)
	self.input1:SetSize(self.sx/10, 25, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 3
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable4","Attributes:",self.sx/10*1,self.sy/10*sy,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","",self.sx/10*2,self.sy/10*sy)
	self.input2:SetSize(self.sx/10*3.5, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetList","Edit list",self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesSetList","Confirm list",self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable5","More:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddButton2(self,"bntEnterTangMgr","Open",self.sx/10,self.sy/10*sy):SetSize(self.sx/10*0.8, 25, false)


	self.AttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.GlobleSchoolsListCOP = self:AddCOP("GlobleSchoolsListCOP",-self.sx/10*4.16,self.sy/10*0.7,2)
	
	SchoolManager.listtypes=0
	self.chooseSchoolNum = 0
	SchoolManager.numArrey=13
	SchoolManager.boolArrey=3
	SchoolManager.GlobleSchoolBaseAttributeName2=0
	SchoolManager.SchoolAttribute=
	{
		SchoolMgr.Name,SchoolMgr.Prefix,SchoolMgr.Suffix,
		SchoolMgr.BaseScore,SchoolMgr.BadScore,SchoolMgr.GoodScore,SchoolMgr.DiscipleCount,
		SchoolMgr.UnLockScore,
		SchoolMgr.UnLockLevel,SchoolMgr.MasterID,SchoolMgr.FoodIndex,SchoolMgr.TalkGetSecret,
		
		SchoolMgr.AutoCook,SchoolMgr.Created,SchoolMgr.TipFengshui
	}
	SchoolManager.SchoolAttributeDisplayName=
	{
		"Sect Name:","Former:","After:",
		
		"Prestige:","Evil:","Good:","Disciples:",
		"Unlock points:",
		"Unlock level:","MasterID:","Food:","Secrets:",
		"Max disciples:","Max outer disciples:","Max inner disciples:","Max Cave disciples:",
		"Auto cook:","Created:","Feng Shui:"
		
	}
	SchoolManager.GlobleSchoolBaseAttributeName=
	{
	"SectName:Name","Description:Desc","Law:Gong","Secret arts:Miji",
	"SectMaster:GMaster","UnlockBuildings:UnLockBuilding","Array:ZhenInfo","ArrayName:ZhenName",
	"SectID:ID","LawLevel:GLevel","Elder:MinElder","ArrayNeeds:ZhenEliderNeed",
	"SectLevel:Level","Rank:Rank","Relations:Relation"
	}
	SchoolManager.GlobleSchoolBaseAttributeName2={}
	QFWDlib.OnInit()
	SchoolManager:ForeEnter()
	self.nowType=0
	self.window:Center()
end

function SchoolManager:OnShowUpdate()
	
end

function SchoolManager:OnShown()
	SchoolManager.isShowing = true
	ModifierMain.showWindow=13
end

function SchoolManager:OnUpdate()
	
end

function SchoolManager:OnHide()
	SchoolManager.isShowing = false
	ModifierMain.showWindow=0
end

function SchoolManager:Test()
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("Test")
		local num=func:Invoke()
		print(tostring(num))
	end
	return -4
end
function SchoolManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntEnterTangMgr" then
			SchoolManager:EnterTangMgr()
			SchoolManager.ShowLable.text = "Hall manage"
			return
		end
		if obj.name == "bntUpdataSchoolAttribute" then
			SchoolManager:GetSchoolAttribute()
			SchoolManager.nowType = 0
			
			SchoolManager.ShowLable.text = "Viewing sect"
			return
		end
		if obj.name == "bntUpdataSchoolsList" then
			SchoolManager:ShowNpcAttribute()
			SchoolManager.ShowLable.text = "View all sects!"
			return
		end
		if obj.name == "bntChooseSchool" then
			local num = 0
			num = tonumber(SchoolManager.inputid1.m_title.text)
			if num == nil then
				SchoolManager.ShowLable.text = "No ID, Failed!"
				return
			elseif num > #QFWDlib.GlobleSchools then
				SchoolManager.ShowLable.text = "Invalid ID, Failed!"
				return
			else
				SchoolManager.nowType = 1
				SchoolManager:ShowChildGlobleSchoolAttribute(num)
				local schoolName = tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name)
				SchoolManager.ShowLable.text = "Selected sect: "..schoolName.." successfully!"
				SchoolManager.ShowLableNpc.text = "Current sect: "..schoolName
				return
			end
		end
		if obj.name == "bntSetList" then
			local num = 0
			num = tonumber(SchoolManager.input1.m_title.text)
			if SchoolManager.nowType==0 then
				if num == nil then
					SchoolManager.ShowLable.text = "No ID, Failed!"
					return
				elseif num > #SchoolManager.SchoolAttribute then
					SchoolManager.ShowLable.text = "Invalid ID, Failed!"
					return
				else
					SchoolManager:SetSchoolAttributeList(num,SchoolManager.input2.m_title.text)
					SchoolManager.ShowLable.text = "Successfully modified!"
					return
				end
			elseif SchoolManager.nowType==1 then
				if num == nil then
					SchoolManager.ShowLable.text = "No ID, Failed!"
					return
				elseif num > #SchoolManager.GlobleSchoolBaseAttributeName2 then
					SchoolManager.ShowLable.text = "Invalid ID, Failed!"
					return
				else
					SchoolManager:SetGlobleSchoolAttributeList(num,SchoolManager.input2.m_title.text)
					SchoolManager.ShowLable.text = "Successfully modified!"
					return
				end
			end
		end
		if obj.name == "bntYesSetList" then
			if SchoolManager.nowType==0 then
				SchoolManager:SetTheSchoolAttribute()
			elseif SchoolManager.nowType==1 then
				SchoolManager:SetTheGlobleSchoolAttribute()
			end
			SchoolManager.ShowLable.text = "Saved!"
			return
		end
		if obj.name == "bntRemoveSchool" then
			if SchoolManager.nowType==0 then
				SchoolManager.ShowLable.text = "Cannot delete sect!"
			elseif SchoolManager.nowType==1 then
				SchoolManager.ShowLable.text = "Try to delete sect data!"
				if SchoolManager:RemoveSchool() then
					SchoolManager.ShowLable.text = "Data deleted!"
				else
					SchoolManager.ShowLable.text = "Failed to delete data!"
				end
			end
			
			return
		end
		if obj.name == "bntShowAllSchool" then
			if SchoolManager:ShowAllSchool() then
				SchoolManager.ShowLable.text = "Shown all sects!"
			else
				SchoolManager.ShowLable.text = "Failed to show all sects!"
			end
			
			return
		end
	end
end
function SchoolManager:ShowAllSchool()
	return SchoolManager:RegetChildGlobleSchools()
end
function SchoolManager:RemoveSchool()
	local num = tonumber(SchoolManager.inputid1.m_title.text)
	if num==nil then
		return false
	end
	local schoolDatas = QFWDlib.GlobleSchools[num]
	if schoolDatas==nil or schoolDatas.ID==nil then
		return false
	end
	local MyID=schoolDatas.ID
	local schools=CS.XiaWorld.SchoolGlobleMgr.m_mapSchoools
	if schools ==nil then
		return false
	end
	local localKey=nil
	local localValue=nil
	local schoolPower=CS.XiaWorld.SchoolGlobleMgr.SchoolPowerData
	if schoolPower~=nil then
		for localKey, localValue in pairs(schoolPower) do
			if localValue~= nil and localValue.ID==MyID then
				schoolPower:Remove(localKey)
			end
		end
	end
	local schoolMsg=CS.XiaWorld.SchoolGlobleMgr.SchoolMsgs
	if schoolMsg~=nil then
		for localKey, localValue in pairs(schoolMsg) do
			if localValue~= nil and (localValue.FSchool==MyID or localValue.TSchool==MyID )then
				schoolMsg:Remove(localValue)
			end
		end
	end
	for localKey, localValue in pairs(schools) do
		if localValue~= nil and localValue.ID==MyID then
			schools:Remove(localKey)
		end
	end

	return true
end
function SchoolManager:EnterTangMgr()
	self.SchoolTangManager:Show()
	SchoolManager:Hide()
end
function SchoolManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function SchoolManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function SchoolManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function SchoolManager:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	obj.m_title.text = value
	--obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function SchoolManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(SchoolManager.ListChildOnClick)
	obj.m_title.text = "List"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text="None"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	return obj
end
function SchoolManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(SchoolManager.ListChildOnClick2)
	obj.m_title.text = "List"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text="None"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	return obj
end
function SchoolManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	SchoolManager.TheClickBnt = tonumber(Eventss.data.name)
	SchoolManager:SetSetting()
	
end
function SchoolManager:SetSetting(types)
	local obj=nil
	if types==nil then
		obj=SchoolManager.inputid1
	else
		obj=SchoolManager.inputid1
	end
	obj.m_title.text=tostring(SchoolManager.TheClickBnt)
	SchoolManager.nowType = 1
	SchoolManager:ShowChildGlobleSchoolAttribute(SchoolManager.TheClickBnt)
	local schoolName = tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name)
	SchoolManager.ShowLable.text = "Selected sect: "..schoolName.." successfully!"
	SchoolManager.ShowLableNpc.text = "Current sect: "..schoolName
end
function SchoolManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	SchoolManager.TheClickBnt = tonumber(Eventss.data.name)
	SchoolManager:SetSetting2()
	
end
function SchoolManager:SetSetting2()
	local obj=nil
	local types=SchoolManager.nowType
	if types==nil or types==0 then
		obj=SchoolManager.input1
	else
		obj=SchoolManager.input1
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(SchoolManager.TheClickBnt)
		
	elseif types<=8 then
		obj.m_title.text=tostring(SchoolManager.TheClickBnt)
	end
	local num = 0
	num = tonumber(SchoolManager.input1.m_title.text)
	if num == nil then
		SchoolManager.ShowLableAttribute.text="Current attribute: None"
		return
	elseif num==0 then
		SchoolManager.ShowLableAttribute.text="Current attribute: None"
	else
		if SchoolManager.nowType==0 then
			if num > #SchoolManager.SchoolAttributeDisplayName then
				SchoolManager.ShowLableAttribute.text="Current attribute: None"
				return
			else
				SchoolManager.ShowLableAttribute.text="Current attribute: "..SchoolManager.SchoolAttributeDisplayName[num]
			end
		elseif SchoolManager.nowType==1 then
			if num > #SchoolManager.GlobleSchoolBaseAttributeName2 then
				SchoolManager.ShowLableAttribute.text="Current attribute: None"
				return
			else
				SchoolManager.ShowLableAttribute.text="Current attribute: "..SchoolManager.GlobleSchoolBaseAttributeName2[num]
				SchoolManager.input2.m_title.text=SchoolManager.GlobleSchoolBaseAttribute[num]
			end
		end
	end
		--SchoolManager:ChooseThingNumAndGetAttribute(SchoolManager.TheClickBnt)
end




function SchoolManager:ForeEnter()
	SchoolManager:UpdataLibSchoolAttribute()
	SchoolManager:RegetChildGlobleSchools()
	SchoolManager:UpdateChildGlobleSchools(SchoolManager.GlobleSchoolsListCOP)
	SchoolManager:GetSchoolAttribute()
end
function SchoolManager:SetGlobleSchoolAttributeList(num,value)
	SchoolManager.GlobleSchoolBaseAttribute[num] = value
	SchoolManager:UpdateChildGlobleSchoolAttribute(SchoolManager.AttributeListCOP)
end
function SchoolManager:SetSchoolAttributeList(num,value)
	local level1=3+SchoolManager.numArrey
	local level2=level1+SchoolManager.boolArrey
	if num==1 then 
		num=1
	elseif num <=3 then
		SchoolManager.SchoolAttributeStr[num]=value
	elseif num<=level1 then
		SchoolManager.SchoolAttributeStr[num]=tonumber(value)
	elseif num<=level2 then
		if value=="true" or value =="True" or value=="TRUE" then
			SchoolManager.SchoolAttributeStr[num]=true
		else
			SchoolManager.SchoolAttributeStr[num]=false
		end
	else
		SchoolManager.SchoolAttributeStr[num]=tonumber(value)
	end
	SchoolManager:UpdateChildAttribute(SchoolManager.AttributeListCOP)
end
function SchoolManager:GetSchoolAttribute()
	SchoolManager:UpdataLibSchoolAttribute()
	SchoolManager.SchoolAttributeStr={}
	local num=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(SchoolManager.SchoolAttribute) do
		SchoolManager.SchoolAttributeStr[num]=localValue
		num=num+1
	end
	SchoolManager:UpdateChildAttribute(SchoolManager.AttributeListCOP)
end
function SchoolManager:UpdateChildAttribute(obj)
	SchoolManager:UpdataLibSchoolAttribute()
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Basic attributes"
	local num=1
	local fixnum=3 + SchoolManager.numArrey
	for z=1,fixnum do
		SchoolManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(SchoolManager.SchoolAttributeDisplayName[num]))
		SchoolManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(SchoolManager.SchoolAttributeStr[num]))
		num=num+1
	end
	for z=1,SchoolManager.boolArrey do
		SchoolManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(SchoolManager.SchoolAttributeDisplayName[num]))
		if SchoolManager.SchoolAttributeStr[num] then
			SchoolManager:AddChildToList(obj,"0"..tostring(num),"true")
		else
			SchoolManager:AddChildToList(obj,"0"..tostring(num),"false")
		end
		
		num=num+1
	end

	
	-- for k, v in pairs() do
		-- print(v.Name)
		-- num=num+1
	-- end
	
end
function SchoolManager:ShowChildGlobleSchoolAttribute(tnum)
	local schoolDatas = QFWDlib.GlobleSchools[tnum]
	SchoolManager.chooseSchoolNum = tnum
	local num=1
	SchoolManager.GlobleSchoolBaseAttribute={}
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Desc)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Gong)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Miji)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].GMaster)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].UnLockBuilding)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ZhenInfo)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ZhenName)
	
	
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].GLevel)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].MinElder)
	num=num+1
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ZhenEliderNeed)
	
	
	num=num+1
	local level=1
	if QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Level==QFWDlib.SchoolLevel[1] then
		level=1
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Level==QFWDlib.SchoolLevel[2] then
		level=2
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Level==QFWDlib.SchoolLevel[3] then
		level=3
	else
		level=4
	end
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(level)
	num=num+1
	local rank=1
	if QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[1] then
		rank=1
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[2] then
		rank=2
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[3] then
		rank=3
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[4] then
		rank=4
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[5] then
		rank=5
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[6] then
		rank=6
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[7] then
		rank=7
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[8] then
		rank=8
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[9] then
		rank=9
	end
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(rank)
	num=num+1
	
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(SchoolMgr:GetSchoolRelation(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID))
	SchoolManager.RelationToMe = SchoolManager.GlobleSchoolBaseAttribute[num]
	local lnum=1
	SchoolManager.GlobleSchoolBaseAttributeName2={}
	for lnum=1,#SchoolManager.GlobleSchoolBaseAttributeName do
		SchoolManager.GlobleSchoolBaseAttributeName2[lnum]=SchoolManager.GlobleSchoolBaseAttributeName[lnum]
	end
	local trd=CS.XiaWorld.TradeMgr
	if trd~=nil then
		local trd2=trd.Instance
		if trd2~=nil then
			local Trade= trd2:GetSchoolTrade(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
			local TradeDef=trd2:GetSchoolTradeDef(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
			if Trade~=nil and TradeDef~=nil then
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="All random count:AllRandomCount"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.AllRandomCount)
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="Friendliness:LikeFriendPoint"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.LikeFriendPoint)
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="Relation:LikeRelation"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.LikeRelation)
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="Price:Price"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.Price)
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="Talk:Talk"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.Talk)
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="Lower purchase price:BuyPriceReducep"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(Trade.BuyPriceReducep)
				num=num+1
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="Increase global favor points:AddFreeGlobalFriendPoint"
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(Trade.FreeGlobalFriendPoint)
				if TradeDef.Gong~=nil then
					local TradeDefG=TradeDef.Gong
					num=num+1
					SchoolManager.GlobleSchoolBaseAttributeName2[num]="Laws:Count"
					SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefG.Count)
					num=num+1
					SchoolManager.GlobleSchoolBaseAttributeName2[num]="Days to reset law:ResetDay"
					SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefG.ResetDay)
					if TradeDefG.BuyPrice~=nil then
						local TradeDefGB=TradeDefG.BuyPrice
						num=num+1
						SchoolManager.GlobleSchoolBaseAttributeName2[num]="Price:Value"
						SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefGB.Value)
						num=num+1
						SchoolManager.GlobleSchoolBaseAttributeName2[num]="Favor points for law:FriendPoint"
						SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefGB.FriendPoint)
					end
					if TradeDefG.Condition~=nil then
						local TradeDefGC=TradeDefG.Condition
						num=num+1
						SchoolManager.GlobleSchoolBaseAttributeName2[num]="Realm required:NeedRank[0-7]"
						SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefGC.NeedRank)
					end
				end
			end
		end
	end
	local GSchoolMgr=CS.XiaWorld.SchoolGlobleMgr
	if GSchoolMgr~=nil and GSchoolMgr.Instance~=nil then
		local power=GSchoolMgr.Instance:GetSchoolPower(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
		if power~=nil then
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Powerful kill:DNKill"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.DNKill)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Gifts:GiftCount"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.GiftCount)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Corrections:HappenFix"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.HappenFix)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Location:LockPlace"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.LockPlace)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Martial prowess:Power"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.Power)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Tribute day:SubmissionDay"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.SubmissionDay)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="Tribute:IsSubmission"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.Suzerain)
			num=num+1
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="State:State[0-3, None, Normal, Closed sect, Destroyed sect]"
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.State)
			
		end
	end
	SchoolManager.GlobleSchoolBaseAttributeOld={}
	local localKey,localValue=nil,nil
	for num, localValue in pairs(SchoolManager.GlobleSchoolBaseAttribute) do
		SchoolManager.GlobleSchoolBaseAttributeOld[num]=localValue
	end
	SchoolManager:UpdateChildGlobleSchoolAttribute(SchoolManager.AttributeListCOP)
end
function SchoolManager:UpdateChildGlobleSchoolAttribute(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Sect atr-"..tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name)
	local num=1
	local localKey,localValue=nil,nil
	for localKey, localValue in pairs(SchoolManager.GlobleSchoolBaseAttributeOld) do
		SchoolManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(SchoolManager.GlobleSchoolBaseAttributeName2[num]))
		SchoolManager:AddChildToList(obj,"0"..tostring(localKey)," "..tostring(SchoolManager.GlobleSchoolBaseAttribute[num]))
		num=num+1
	end
end
function SchoolManager:UpdateChildGlobleSchools(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of sects"
	local num=1
	local localKey,localValue=nil,nil
	for localKey, localValue in pairs(QFWDlib.GlobleSchools) do
		SchoolManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(localValue.Name))
		num=num+1
	end
end

function SchoolManager:SetTheSchoolAttribute()
	--SchoolManager:UpdataLibSchoolAttribute()
	SchoolMgr:ChangeSchoolName(SchoolManager.SchoolAttributeStr[2],SchoolManager.SchoolAttributeStr[3])
	local num=4
	
--
	-- SchoolMgr.Prefix=SchoolManager.SchoolAttributeStr[num]
	-- num=num+1
	-- SchoolMgr.Suffix=SchoolManager.SchoolAttributeStr[num]
	-- num=num+1
	
	SchoolMgr.BaseScore=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.BadScore=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.GoodScore=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.DiscipleCount=SchoolManager.SchoolAttributeStr[num]
	
	
	
	num=num+1
	SchoolMgr:AddUnLockScore(SchoolManager.SchoolAttributeStr[num]-SchoolMgr.UnLockScore)
	num=num+1
	SchoolMgr.UnLockLevel=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.MasterID=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.FoodIndex=SchoolManager.SchoolAttributeStr[num]

	num=num+1
	SchoolMgr.TalkGetSecret=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	CS.XiaWorld.GameDefine.SchoolMaxNpc[0]=SchoolManager.SchoolAttributeStr[num]
	
	num=num+1
	CS.XiaWorld.GameDefine.SchoolMaxNpc[1]=SchoolManager.SchoolAttributeStr[num]
	
	num=num+1
	CS.XiaWorld.GameDefine.SchoolMaxNpc[2]=SchoolManager.SchoolAttributeStr[num]
	
	num=num+1
	CS.XiaWorld.GameDefine.SchoolMaxNpc[3]=SchoolManager.SchoolAttributeStr[num]
	
	num=num+1
	SchoolMgr.AutoCook=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.Created=SchoolManager.SchoolAttributeStr[num]
	num=num+1
	SchoolMgr.TipFengshui=SchoolManager.SchoolAttributeStr[num]
	num=num+1

	-- SchoolMgr.FoodIndex=SchoolManager.SchoolAttributeStr[num]
	-- num=num+1
	
	--SchoolMgr.BaseScore=2000
	SchoolManager:UpdateChildAttribute(SchoolManager.AttributeListCOP)
	--SchoolManager:ShowChildGlobleSchoolAttribute(tonumber(SchoolManager.inputid1.m_title.text))
end
function SchoolManager:SetTheGlobleSchoolAttribute()
	local schoolDatas = QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum]
	local num=1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Name = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Desc = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Gong = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Miji = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.GMaster = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.UnLockBuilding = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ZhenInfo = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ZhenName = SchoolManager.GlobleSchoolBaseAttribute[num]
	end
	num=num+1
	
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ID = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
	end
	local schoolID =tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.GLevel = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.MinElder = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ZhenEliderNeed = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		local level = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
		if level~=nil then
			schoolDatas.Level = QFWDlib.SchoolLevel[level]
		end
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		local rank = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
		if rank~=nil then
			schoolDatas.Rank = QFWDlib.SchoolRank[rank]
		end
	end
	num=num+1
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		local value = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])-tonumber(SchoolManager.GlobleSchoolBaseAttributeOld[num])
		SchoolMgr:AddSchoolRelation(schoolID,value)
	end
	local trd=CS.XiaWorld.TradeMgr
	if trd~=nil then
		local trd2=trd.Instance
		if trd2~=nil then
			local Trade= trd2:GetSchoolTrade(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
			local TradeDef=trd2:GetSchoolTradeDef(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
			--local Trade
			--Trade=trd2.SchoolTrade
			if Trade~=nil and TradeDef~=nil then
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.AllRandomCount = tostring(SchoolManager.GlobleSchoolBaseAttribute[num])
				end
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.LikeFriendPoint = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
				end
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.LikeRelation = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
				end
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.Price = SchoolManager.GlobleSchoolBaseAttribute[num]
				end
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.Talk = SchoolManager.GlobleSchoolBaseAttribute[num]
				end
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					trd2:SetBuyPriceReduce(tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]))
					--Trade.FreeGlobalFriendPoint = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
				end
				num=num+1
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					trd2:AddGlobalFriendPoint(tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]))
				end
				if TradeDef.Gong~=nil then
					local TradeDefG=TradeDef.Gong
					num=num+1
					if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
						TradeDefG.Count = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
					end
					num=num+1
					if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
						TradeDefG.ResetDay = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
					end
					if TradeDefG.BuyPrice~=nil then
						local TradeDefGB=TradeDefG.BuyPrice
						num=num+1
						if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
							TradeDefGB.Value = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
						end
						num=num+1
						if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
							TradeDefGB.FriendPoint = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
						end
					end
					if TradeDefG.Condition~=nil then
						local TradeDefGC=TradeDefG.Condition
						num=num+1
						if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
							TradeDefGC.NeedRank = QFWDlib.SchoolRelationRank[tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])]
						end
					end
				end
			end
		end
	end
	local GSchoolMgr=CS.XiaWorld.SchoolGlobleMgr
	if GSchoolMgr~=nil and GSchoolMgr.Instance~=nil then
		local power=GSchoolMgr.Instance:GetSchoolPower(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
		if power~=nil then
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.DNKill = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.GiftCount = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.HappenFix = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.LockPlace = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.Power = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.SubmissionDay = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.Suzerain = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
			end
			num=num+1
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				local datanum=tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])
				local data=QFWDlib.SchoolState[datanum+1]
				if data~=nil then
					power.State = data
				end
			end
		end
	end
	
	SchoolManager:ShowChildGlobleSchoolAttribute(SchoolManager.chooseSchoolNum)
end
function SchoolManager:UpdataLibSchoolAttribute()
	SchoolManager.SchoolAttribute=
	{
		SchoolMgr.Name,SchoolMgr.Prefix,SchoolMgr.Suffix,
		SchoolMgr.BaseScore,SchoolMgr.BadScore,SchoolMgr.GoodScore,SchoolMgr.DiscipleCount,
		SchoolMgr.UnLockScore,
		SchoolMgr.UnLockLevel,SchoolMgr.MasterID,SchoolMgr.FoodIndex,SchoolMgr.TalkGetSecret,
		CS.XiaWorld.GameDefine.SchoolMaxNpc[0],CS.XiaWorld.GameDefine.SchoolMaxNpc[1],CS.XiaWorld.GameDefine.SchoolMaxNpc[2],CS.XiaWorld.GameDefine.SchoolMaxNpc[3],
		
		SchoolMgr.AutoCook,SchoolMgr.Created,SchoolMgr.TipFengshui
	}
end
function SchoolManager:RegetChildGlobleSchools(types)
	local num=1
	QFWDlib.GlobleSchools={}
	local schools=CS.XiaWorld.SchoolGlobleMgr.m_mapSchoools
	if schools ==nil then
		return false
	end
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(schools) do
		if localValue~= nil then
			QFWDlib.GlobleSchools[num] = localValue
			
			num=num+1
		end
	end
	if types==nil then
		SchoolManager:UpdateChildGlobleSchools(SchoolManager.GlobleSchoolsListCOP)
	end
	return true
end