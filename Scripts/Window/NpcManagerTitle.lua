NpcManagerTitle = CS.Wnd_Simple.CreateWindow("NpcManagerTitle")
ModifierMain:AddWindow("NpcManagerTitle",NpcManagerTitle)
local NpcManager = ModifierMain:FindWindow("NpcManager")
function NpcManagerTitle:OnInit()
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("NPC Title modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	self.TheClickBnt =0
	local ky = 1.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableTitle","Title mgr:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky+0.5
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current title: None",self.sx/10,self.sy/10*ky,300,35)
	QFWDModifierMainUI:AddLable2(self,"ShowLableTitleID","ID:",self.sx/10*7.2,self.sy/10*ky,300,35)
	self.inputTatle = QFWDModifierMainUI:AddInput2(self,"inputTatle","1",self.sx/10*8,self.sy/10*ky)
	self.inputTatle:SetSize(70, 25, false)
	self.inputTatle.m_title.restrict = "[0-9]"
	self.inputTatle.m_title.maxLength = 3
	ky = ky+0.5
	QFWDModifierMainUI:AddLable2(self,"lableP1","Name:",self.sx/10,self.sy/10*ky,200,35)
	self.inputp1 = QFWDModifierMainUI:AddInput2(self,"inputp1","Qingfeng",self.sx/10*1.5,self.sy/10*ky)
	self.inputp1:SetSize(self.sx/10*2, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lableP2","Intro:",self.sx/10*4,self.sy/10*ky,200,35)
	self.inputp2 = QFWDModifierMainUI:AddInput2(self,"inputp2","This is a title",self.sx/10*4.5,self.sy/10*ky)
	self.inputp2:SetSize(self.sx/10*4.5, 25, false)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lableP3","Grade:",self.sx/10,self.sy/10*ky,200,35)
	self.inputp3 = QFWDModifierMainUI:AddInput2(self,"inputp3","1",self.sx/10*1.5,self.sy/10*ky)
	self.inputp3:SetSize(40, 25, false)
	self.inputp3.m_title.restrict = "[0-9]"
	self.inputp3.m_title.maxLength = 1
	QFWDModifierMainUI:AddLable2(self,"lableP4","Types:",self.sx/10*2.5,self.sy/10*ky,200,35)
	self.inputp4 = QFWDModifierMainUI:AddInput2(self,"inputp4","1",self.sx/10*3,self.sy/10*ky)
	self.inputp4:SetSize(40, 25, false)
	self.inputp4.m_title.restrict = "[0-9]"
	self.inputp4.m_title.maxLength = 1
	QFWDModifierMainUI:AddLable2(self,"lableP5","Parameter:",self.sx/10*4,self.sy/10*ky,200,35)
	self.inputp5 = QFWDModifierMainUI:AddInput2(self,"inputp5","0",self.sx/10*4.5,self.sy/10*ky)
	self.inputp5:SetSize(40, 25, false)
	self.inputp5.m_title.restrict = "[0-9]"
	self.inputp5.m_title.maxLength = 5
	QFWDModifierMainUI:AddButton2(self,"bntNpcAddTitle","Add title",self.sx/10*6.75,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntNpcRemoveTitle","Remove title",self.sx/10*5.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdateTitle","Refresh",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	ky = ky+1.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableNeed","Needs mgr:",self.sx/10,self.sy/10*(ky-0.5),100,35)
	self.ShowLableNeedNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNeedNpc","Current need: None",self.sx/10,self.sy/10*ky,300,35)
	QFWDModifierMainUI:AddLable2(self,"ShowLableTitleID","ID:",self.sx/10*7.2,self.sy/10*ky,300,35)
	self.inputNeed = QFWDModifierMainUI:AddInput2(self,"inputNeed","1",self.sx/10*8,self.sy/10*ky)
	self.inputNeed:SetSize(70, 25, false)
	self.inputNeed.m_title.restrict = "[0-9]"
	self.inputNeed.m_title.maxLength = 2
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lablen1","Value:",self.sx/10,self.sy/10*ky,200,35)
	self.inputNeed1 = QFWDModifierMainUI:AddInput2(self,"inputNeed1","1",self.sx/10*1.5,self.sy/10*ky)
	self.inputNeed1:SetSize(70, 25, false)
	self.inputNeed1.m_title.maxLength = 5
	QFWDModifierMainUI:AddButton2(self,"bntUpdateNeed","Refresh",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetNeedValue","Edit list",self.sx/10*5.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesSetNeedValue","Confirm list",self.sx/10*6.75,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntFullNeed1","FullNeeds",self.sx/10*4.25,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveNeed","Remove need",self.sx/10*3,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	ky = ky+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableJob","Work mgr:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky+0.5
	self.ShowLableJobNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableJobNpc","Current job: None",self.sx/10,self.sy/10*ky,300,35)
	QFWDModifierMainUI:AddLable2(self,"ShowLableJobID","ID:",self.sx/10*7.2,self.sy/10*ky,300,35)
	self.inputJob = QFWDModifierMainUI:AddInput2(self,"inputJob","1",self.sx/10*8,self.sy/10*ky)
	self.inputJob:SetSize(70, 25, false)
	self.inputJob.m_title.restrict = "[0-9]"
	self.inputJob.m_title.maxLength = 2
	ky = ky + 0.5
	
	QFWDModifierMainUI:AddButton2(self,"bntUpdateJob","Refresh",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntBeginJob","Start",self.sx/10*5.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntFinishJob","Finish",self.sx/10*6.75,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntGetCMD","Get jobs",self.sx/10*4.25,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntFindJob","Find job",self.sx/10*3,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntFindAllNpcJob","All jobs",self.sx/10*1,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	ky = ky+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableRelationShip","Relationship mgr:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky+0.5
	self.ShowLableRelationNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableRelationNpc","Current relation: None",self.sx/10,self.sy/10*ky,self.sx/10*3,35)
	QFWDModifierMainUI:AddLable2(self,"ShowLableTitleRelationID","ID:",self.sx/10*3.2,self.sy/10*ky,self.sx/10*1,35)
	self.inputRelation = QFWDModifierMainUI:AddInput2(self,"inputRelation","1",self.sx/10*3.8,self.sy/10*ky)
	self.inputRelation:SetSize(50, 25, false)
	self.inputRelation.m_title.restrict = "[0-9]"
	self.inputRelation.m_title.maxLength = 2
	QFWDModifierMainUI:AddButton2(self,"bntRemoveRelation","Remove relation",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAllRelation","Remove all",self.sx/10*6.1,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdateRelation","Refresh",self.sx/10*7.2,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowAllRelation","All relations",self.sx/10*8.3,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 0.5
	self.ShowLableRelationNpcName = QFWDModifierMainUI:AddLable2(self,"ShowLableRelationNpcName","Current NPC: None",self.sx/10*1,self.sy/10*ky,self.sx/10*3,35)
	QFWDModifierMainUI:AddLable2(self,"lablenr1","ID:",self.sx/10*3.2,self.sy/10*ky,self.sx/10*1,35)
	self.inputRelation1 = QFWDModifierMainUI:AddInput2(self,"inputRelation1","1",self.sx/10*3.8,self.sy/10*ky)
	self.inputRelation1:SetSize(50, 25, false)
	self.inputRelation1.m_title.maxLength = 5
	QFWDModifierMainUI:AddButton2(self,"bntRemoveRelationOne","Remove relation",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveRelationNpcAll","Remove all",self.sx/10*6.1,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowRelationAllNpc","All NPCs",self.sx/10*7.2,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddRelation","Add relation",self.sx/10*8.3,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableFlag","Flag mgr:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lablenf1","ID:",self.sx/10*1,self.sy/10*ky,self.sx/10*1,35)
	self.inputRelationf1 = QFWDModifierMainUI:AddInput2(self,"inputRelationf1","1",self.sx/10*2,self.sy/10*ky)
	self.inputRelationf1:SetSize(self.sx/10*2, 25, false)
	self.inputRelationf1.m_title.maxLength = 5
	QFWDModifierMainUI:AddButton2(self,"bntRemoveFlag","Remove flag",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddFlag","Add flag",self.sx/10*6.1,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowAllFlag","All flags",self.sx/10*7.2,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdateFlag","Refresh",self.sx/10*8.3,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	
	
	NpcManagerTitle.JobBaseType=0
	NpcManagerTitle.allFoundJobBaseList={}
	NpcManagerTitle.allFoundNPC={}
	NpcManagerTitle.allFoundJobBaseNameList={}
	NpcManagerTitle.FoundJobBaseNum=1
	NpcManagerTitle.allJobCMDList={}

	NpcManagerTitle.JobCMDNum=1
	self.ShowWho=0
	

	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.NpcListCOP = self:AddCOP("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	self.chooseNpcNum = 0
	self.window:Center()
end

function NpcManagerTitle:OnShowUpdate()
	
end

function NpcManagerTitle:OnShown()
	NpcManagerTitle.isShowing = true
	NpcManager:Hide()
end

function NpcManagerTitle:OnUpdate()
end

function NpcManagerTitle:OnHide()
	NpcManager:Show()
	NpcManagerTitle.isShowing = false
	ModifierMain.showWindow=0
end
function NpcManagerTitle:IntNpc(npc)
	local name=npc:GetName()
	if name==nil then
		NpcManagerTitle.ShowLable.text="Anonymous？！"
		NpcManagerTitle:SetTitle("Anonymous")
	end
	NpcManagerTitle.ShowLable.text="Current NPC: "..tostring(name)
	NpcManagerTitle:SetTitle(tostring(name))
	NpcManagerTitle.chooseNPC=npc
	
	NpcManagerTitle:ShowTitleList(NpcManagerTitle.NpcListCOP)
	NpcManagerTitle:ShowNeedList()
end
function NpcManagerTitle:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		local num = 0
	end
end
function NpcManagerTitle:NpcAddTitle()
	local npc=NpcManagerTitle.chooseNPC
	local name=NpcManagerTitle.inputp1.m_title.text
	local desc=NpcManagerTitle.inputp2.m_title.text
	local level=tonumber(NpcManagerTitle.inputp3.m_title.text)
	local types=tonumber(NpcManagerTitle.inputp4.m_title.text)
	local params=tonumber(NpcManagerTitle.inputp5.m_title.text)
	if name==nil then
		name="Qingfeng"
		NpcManagerTitle.inputp1.m_title.text="Qingfeng"
	end
	if desc==nil then
		desc="This is a title"
		NpcManagerTitle.inputp2.m_title.text="This is a title"
	end
	if level==nil or level<0 then
		level=1
		NpcManagerTitle.inputp3.m_title.text="1"
	end
	if types==nil or types<0 then
		NpcManagerTitle.inputp4.m_title.text="1"
		types=QFWDlib.TitleTypes[1]
	elseif types>4 then
		NpcManagerTitle.inputp4.m_title.text="4"
		types=QFWDlib.TitleTypes[4]
	else
		types=QFWDlib.TitleTypes[types]
	end
	if params==nil or params<0 then
		NpcManagerTitle.inputp5.m_title.text="0"
		params=0
	end
	npc:AddTitle(name, params, types, level, desc, false)
	NpcManagerTitle:ShowTitleList()
end
function NpcManagerTitle:NpcRemoveTitle()
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputTatle.m_title.text)
	if num==nil then
		return false
	end
	local ID=NpcManagerTitle.allTatleList[num].Id
	if ID==nil then
		return false
	end
	npc:RemoveTitleByID(ID)
	NpcManagerTitle:ShowTitleList()
	return true
end
function NpcManagerTitle:ShowTitleList(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local titleList=npc.Titles
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	obj.m_title.text = "Title list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local DisplayName=nil
	local num=1
	NpcManagerTitle.allTatleList={}
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			NpcManagerTitle.allTatleList[num]=localValue
			DisplayName=localValue.title
			if DisplayName==nil then
				DisplayName=localValue.Id
			end
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(DisplayName).."---"..tostring(localValue.level).."Class title")
			num=num+1
		end
	end
end
--------------------------------------------------------------------------------------------------------
function NpcManagerTitle:ShowNeedList(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local titleList=npc.Needs.m_mapNeeds
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.AttributeListCOP
	end
	obj.m_title.text = "Need list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	local jc=1
	NpcManagerTitle.allNeedList={}
	NpcManagerTitle.allNeedListName={}
	NpcManagerTitle.allNeedListRange={}
	NpcManagerTitle.allNeedListStr={}
	NpcManagerTitle.allNeedListStrOld={}
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			NpcManagerTitle.allNeedList[num]=localValue
			for jc=1,#QFWDlib.NeedTypesName do
				if localValue.NeedType==QFWDlib.NeedTypes[jc] then
					NpcManagerTitle.allNeedListName[num]=QFWDlib.NeedTypesName[jc]
					break
				end
			end
			NpcManagerTitle.allNeedListRange[num]={}
			NpcManagerTitle.allNeedListRange[num].x=localValue.MinValue
			NpcManagerTitle.allNeedListRange[num].y=localValue.MaxValue
			
			--localValue.ValueRange
			NpcManagerTitle.allNeedListStr[num]=tostring(localValue.Value)
			NpcManagerTitle.allNeedListStrOld[num]=NpcManagerTitle.allNeedListStr[num]
			NpcManager:AddChildToList(obj,tostring(num+10000),tostring(num)..": "..tostring(NpcManagerTitle.allNeedListName[num]))
			NpcManager:AddChildToList(obj,"0"..tostring(num+10000),tostring(NpcManagerTitle.allNeedListStr[num]))
			num=num+1
		end
	end
end
function NpcManagerTitle:ShowNeedListByHaveData(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local titleList=NpcManagerTitle.allNeedListName
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.AttributeListCOP
	end
	obj.m_title.text = "Need list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			NpcManager:AddChildToList(obj,tostring(num+10000),tostring(num)..": "..tostring(localValue))
			NpcManager:AddChildToList(obj,"0"..tostring(num+10000),tostring(NpcManagerTitle.allNeedListStr[num]))
			num=num+1
		end
	end
end
function NpcManagerTitle:SetNeedValue(value)
	if value==nil then
		value=tonumber(NpcManagerTitle.inputNeed1.m_title.text)
		if value==nil then
			value=0
			NpcManagerTitle.inputNeed1.m_title.text="0"
		end
	end
	local choosenum=tonumber(NpcManagerTitle.inputNeed.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputNeed.m_title.text="1"
	end
	local mins=NpcManagerTitle.allNeedListRange[choosenum].x
	local maxs=NpcManagerTitle.allNeedListRange[choosenum].y
	if mins==nil then
		mins=0
	end
	if maxs==nil then
		maxs=100
	end
	if value<mins then
		value=mins
		NpcManagerTitle.inputNeed1.m_title.text=tostring(mins)
	end
	if value>maxs then
		value=maxs
		NpcManagerTitle.inputNeed1.m_title.text=tostring(maxs)
	end
	NpcManagerTitle.allNeedListStr[choosenum]=tostring(value)
	NpcManagerTitle:ShowNeedListByHaveData()
end
function NpcManagerTitle:YesSetNeedValue()
	local num=1
	local value=0
	for num=1,#NpcManagerTitle.allNeedList do
		value=tonumber(NpcManagerTitle.allNeedListStr[num])
		if value~=nil and NpcManagerTitle.allNeedList[num]~=nil and NpcManagerTitle.allNeedListStr[num]~= NpcManagerTitle.allNeedListStrOld[num] then
			NpcManagerTitle.allNeedList[num]:ChangeValue(value,0)
		end
	end
end

function NpcManagerTitle:FullNeed1()
	local choosenum=tonumber(NpcManagerTitle.inputNeed.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputNeed.m_title.text="1"
	end
	local maxs=NpcManagerTitle.allNeedListRange[choosenum].y
	if maxs==nil then
		maxs=100
	end
	NpcManagerTitle.inputNeed1.m_title.text=tonumber(maxs)
	NpcManagerTitle.allNeedListStr[choosenum]=tostring(maxs)
	NpcManagerTitle:ShowNeedListByHaveData()
end
function NpcManagerTitle:RemoveNeed()
	local npc=NpcManagerTitle.chooseNPC
	local choosenum=tonumber(NpcManagerTitle.inputNeed.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputNeed.m_title.text="1"
	end
	local titleList=npc.Needs.m_mapNeeds
	if titleList==nil or titleList=={} then
		return false
	end
	local wantRe=NpcManagerTitle.allNeedList[choosenum]
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil and localValue== wantRe then
			if titleList:Remove(localKey) then
				return true
			end
		end
	end
	return false
end

---------------------------------------------------------------------------------------------
function NpcManagerTitle:ShowCMDList(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local titleList=CS.XiaWorld.CommandMgr.Instance:GetCommandsAtThing(npc)
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	obj.m_title.text = "CMD list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	local jc=1
	NpcManagerTitle.allCMDList={}
	NpcManagerTitle.allCMDListName={}
	NpcManagerTitle.allCMDListID={}
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			NpcManagerTitle.allCMDList[num]=localValue
			if localValue.def~=nil and localValue.def.Name~=nil then
				NpcManagerTitle.allCMDListName[num]=tostring(localValue.def.Name)
			elseif localValue.CommandType~=nil then
				NpcManagerTitle.allCMDListName[num]=tostring(localValue.CommandType)
			else
				NpcManagerTitle.allCMDListName[num]=tostring(localValue.ID)
			end
			NpcManagerTitle.allCMDListID[num]=localValue.ID
			NpcManager:AddChildToList(obj,tostring(num+20000),tostring(num)..": "..tostring(NpcManagerTitle.allCMDListName[num]))
			num=num+1
		end
	end
end
------------------------------------------------------------------------------
function NpcManagerTitle:ShowJobList(tobj,Jobbase2)
	local npc=NpcManagerTitle.chooseNPC
	local JobEg=npc.JobEngine
	local titleList={}
	titleList[1]=JobEg
	if Jobbase2~=nil then
		titleList[2] = Jobbase2
	end
	if titleList==nil or titleList=={} then
		return false
	end
	NpcManagerTitle.JobBaseType=0
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	obj.m_title.text = "Job list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	local jc=1
	NpcManagerTitle.allJobBaseList={}
	NpcManagerTitle.allJobListName={}
	NpcManagerTitle.allJobListID={}
	for localKey, localValue in pairs(titleList) do
		if localValue.CurJob~=nil or num > 1 then
			local localJob=localValue.CurJob
			if num > 1 then
				localJob = localValue
			end
			NpcManagerTitle.allJobBaseList[num]=localJob
			if localJob.jobdef~=nil and localJob.jobdef.DisplayName~=nil then
				NpcManagerTitle.allJobListName[num]=tostring(localJob.jobdef.DisplayName)
			elseif localJob.jobdef~=nil and localJob.jobdef.Name~=nil then
				NpcManagerTitle.allJobListName[num]=tostring(localJob.jobdef.Name)
			else
				NpcManagerTitle.allJobListName[num]=tostring(localJob.ID)
			end
			NpcManager:AddChildToList(obj,tostring(num+30000),tostring(num)..": "..tostring(NpcManagerTitle.allJobListName[num]))
			num=num+1
		end
	end
	NpcManagerTitle:ShowJobListSX()
end
function NpcManagerTitle:ShowJobListSX(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputJob.m_title.text)
	local jobbase=nil
	if NpcManagerTitle.JobBaseType==1 then
		if num==nil or num==0 or num>#NpcManagerTitle.allFoundJobBaseList then
			return false
		end
		jobbase=NpcManagerTitle.allFoundJobBaseList[num]
		npc=NpcManagerTitle.allFoundNPC[num]
	else
		if num==nil or num==0 or num>#NpcManagerTitle.allJobBaseList then
			return false
		end
		jobbase=NpcManagerTitle.allJobBaseList[num]
	end
	if jobbase==nil or jobbase.jobdef==nil then
		return false
	end
	local theJobDef = jobbase.jobdef
	
	local titleList=
	{
		theJobDef.DisplayName,theJobDef.Name,theJobDef.DriverClass,theJobDef.Desc,
		jobbase.ParentAni,theJobDef.HideProgress,theJobDef.CheckStay,theJobDef.LowOrder,
		jobbase.BehavioursSort,jobbase.ID,jobbase.WorkerId,jobbase.ParentJobID,
		jobbase.CantInterruptJob,jobbase.DontDrop,jobbase.IsFinished,jobbase.NeedCMD,
		jobbase.LockerFixByOther
	}
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.AttributeListCOP
	end
	obj.m_title.text = tostring(NpcManagerTitle.allJobListName[num])
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	for localKey, localValue in pairs(QFWDlib.JobAttributeDisplayName) do
		NpcManager:AddChildToList(obj,tostring(num+100000),tostring(num)..": "..tostring(localValue))
		NpcManager:AddChildToList(obj,"0"..tostring(num+100000)," "..tostring(titleList[num]))
		num=num+1
	end
end
function NpcManagerTitle:FinishJob()
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputJob.m_title.text)
	if num~=1 then
		return false
	end
	local jobbase=NpcManagerTitle.allJobBaseList[num]
	if jobbase==nil then
		return false
	end
	jobbase:FinishJob()
	return true
end
function NpcManagerTitle:BeginJob()
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputJob.m_title.text)
	local JobEg=npc.JobEngine
	if JobEg==nil then
		return false
	end
	--jobbase:FinishJob()
--	JobEg:InterruptJob("ClearCMD",false, true)
	--JobEg:ClearBehaviour(false)
	JobEg:RestEngine(npc)
	local jobbase=nil
	if NpcManagerTitle.JobBaseType==0 or NpcManagerTitle.JobBaseType==nil then
		if num==nil or num < 1 or num>#NpcManagerTitle.allJobBaseList then
			return false
		end
		jobbase=NpcManagerTitle.allJobBaseList[num]
	else
		if num==nil or num < 1 or num>#NpcManagerTitle.allFoundJobBaseList then
			return false
		end
		jobbase=NpcManagerTitle.allFoundJobBaseList[num]
	end
	if jobbase==nil then
		return false
	end
	JobEg:BeginJob(jobbase)
	return true
end
function NpcManagerTitle:FindJob()
	local npc=NpcManagerTitle.chooseNPC
	local JobEg=npc.JobEngine
	if JobEg==nil then
		return false
	end
	local newJob=JobEg:TryFindJob()
	if newJob~=nil then
		NpcManagerTitle:ShowJobList(nil,newJob)
		return true
	else
		return false
	end
	
end
function NpcManagerTitle:GetCMD()
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputJob.m_title.text)
	if num==nil or num==0 or num>#NpcManagerTitle.allJobBaseList then
		return false
	end
	local jobbase=NpcManagerTitle.allJobBaseList[num]
	if jobbase==nil or jobbase.CMD==nil then
		return false
	end
	NpcManagerTitle.JobCMD = jobbase.CMD
	return true
end
function NpcManagerTitle:FindAllNpcJob(tobj)
	local NpcLists=Map.Things.m_lisNpcs
	if NpcLists==nil then
		return false
	end
	NpcManagerTitle.JobBaseType=1
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	obj.m_title.text = "Work list"
	obj.m_list:RemoveChildrenToPool()
	local localJob=nil
	local localKey=nil
	local localValue=nil
	local num=1
	for localKey, localValue in pairs(NpcLists) do
		if localValue~=nil and localValue.JobEngine~=nil and localValue.JobEngine.CurJob~=nil then
			NpcManagerTitle.allFoundNPC[num]=localValue
			localJob=localValue.JobEngine.CurJob
			NpcManagerTitle.allFoundJobBaseList[num]=localJob
			if localJob.jobdef~=nil and localJob.jobdef.DisplayName~=nil then
				NpcManagerTitle.allFoundJobBaseNameList[num]=tostring(localJob.jobdef.DisplayName)
			elseif localJob.jobdef~=nil and localJob.jobdef.Name~=nil then
				NpcManagerTitle.allFoundJobBaseNameList[num]=tostring(localJob.jobdef.Name)
			else
				NpcManagerTitle.allFoundJobBaseNameList[num]=tostring(localJob.ID)
			end
			NpcManager:AddChildToList(obj,tostring(num+30000),tostring(num)..": "..tostring(localValue:GetName()).."   "..tostring(NpcManagerTitle.allFoundJobBaseNameList[num]))
			num=num+1
		end
	end
	NpcManagerTitle:ShowJobListSX()
	return true
end
-----------------------------------------------------------------------------------------------------------
function NpcManagerTitle:ShowRelationList(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local sex=true
	if npc.Sex ~= CS.XiaWorld.g_emNpcSex.Male then
		sex=false
	end
	local Reation=npc.PropertyMgr.RelationData
	if Reation==nil then
		return false
	end
	local titleList = Reation.m_mapRelationShips
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	obj.m_title.text = "Relationships"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	--local relationData=nil
	NpcManagerTitle.allRelationList={}
	NpcManagerTitle.allRelationListName={}
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			NpcManagerTitle.allRelationList[num]=localValue
			NpcManagerTitle.allRelationListName[num]=localKey
			-- relationData=npc.PropertyMgr.RelationData:GetRelationData(npc)
			-- if relationData~=nil then
				-- relationData.
				
			-- end
			if sex then
				NpcManager:AddChildToList(obj,tostring(num+40000),tostring(num)..": "..tostring(NpcMgr:GetRelationDef(localKey).DisplayNameM))
			else
				NpcManager:AddChildToList(obj,tostring(num+40000),tostring(num)..": "..tostring(NpcMgr:GetRelationDef(localKey).DisplayNameF))
			end
			num=num+1
		end
	end
end
function NpcManagerTitle:ShowRelationList2(tobj,numss)
	local npcList=NpcManagerTitle.allRelationList[NpcManagerTitle.TheClickBnt]
	if numss~=nil then
		npcList=NpcManagerTitle.allRelationList[numss]
	end
	NpcManagerTitle.ChooseRelation=NpcManagerTitle.TheClickBnt
	if npcList==nil or npcList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.AttributeListCOP
	end
	obj.m_title.text = "Relations"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local num=1
	NpcManagerTitle.allRelationListNPC={}
	NpcManagerTitle.allRelationListNPCName={}
	for localKey, localValue in pairs(npcList) do
		if localValue~=nil then
			NpcManagerTitle.allRelationListNPC[num]=localValue
			NpcManagerTitle.allRelationListNPCName[num]=localValue:GetName()
			-- relationData=npc.PropertyMgr.RelationData:GetRelationData(npc)
			-- if relationData~=nil then
				-- relationData.
				
			-- end
			NpcManager:AddChildToList(obj,tostring(num+50000),tostring(num)..": "..tostring(NpcManagerTitle.allRelationListNPCName[num]))
			num=num+1
		end
	end
end

function NpcManagerTitle:RemoveRelation()
	local npc=NpcManagerTitle.chooseNPC
	local Reation=npc.PropertyMgr.RelationData
	if Reation==nil then
		return false
	end
	local choosenum=tonumber(NpcManagerTitle.inputRelation.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputRelation.m_title.text="1"
	end
	local titleList=NpcManagerTitle.allRelationListNPC
	if titleList==nil or titleList=={} then
		return false
	end
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			Reation:RemoveRelationShip(localValue, NpcManagerTitle.allRelationListName[choosenum])
		end
	end
	Reation.m_mapRelationShips:Remove(NpcManagerTitle.allRelationListName[choosenum])
	NpcManagerTitle:ShowRelationList()
	return true
end
function NpcManagerTitle:RemoveAllRelation()
	local npc=NpcManagerTitle.chooseNPC
	local Reation=npc.PropertyMgr.RelationData
	Reation:RemoveAllRelationShip()
	NpcManagerTitle:ShowRelationList()
	return true
end
function NpcManagerTitle:RemoveRelation()
	local npc=NpcManagerTitle.chooseNPC
	local Reation=npc.PropertyMgr.RelationData
	if Reation==nil then
		return false
	end
	local choosenum=tonumber(NpcManagerTitle.inputRelation.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputRelation.m_title.text="1"
	end
	local titleList=NpcManagerTitle.allRelationListNPC
	if titleList==nil or titleList=={} then
		return false
	end
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			Reation:RemoveRelationShip(localValue, NpcManagerTitle.allRelationListName[choosenum])
		end
	end
	NpcManagerTitle:ShowRelationList()
	return true
end
function NpcManagerTitle:RemoveRelationOne()
	local npc=NpcManagerTitle.chooseNPC
	local Reation=npc.PropertyMgr.RelationData
	local choosenum=tonumber(NpcManagerTitle.inputRelation.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputRelation.m_title.text="1"
	end
	local choosenum2=tonumber(NpcManagerTitle.inputRelation1.m_title.text)
	if choosenum2==nil then
		choosenum2=1
		NpcManagerTitle.inputRelation1.m_title.text="1"
	end
	Reation:RemoveRelationShip(NpcManagerTitle.allRelationListNPC[choosenum2],NpcManagerTitle.allRelationListName[choosenum])
	NpcManagerTitle:ShowRelationList2(nil,NpcManagerTitle.ChooseRelation)
	return true
end
function NpcManagerTitle:RemoveRelationNpcAll()
	local npc=NpcManagerTitle.chooseNPC
	local Reation=npc.PropertyMgr.RelationData
	local choosenum2=tonumber(NpcManagerTitle.inputRelation1.m_title.text)
	if choosenum2==nil then
		choosenum2=1
		NpcManagerTitle.inputRelation1.m_title.text="1"
	end
	Reation:RemoveNpcRelationShip(NpcManagerTitle.allRelationListNPC[choosenum2])
	NpcManagerTitle:ShowRelationList2(nil,NpcManagerTitle.ChooseRelation)
	return true
end
function NpcManagerTitle:ShowRelationAllNpc(tobj)
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.AttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "NPC list"
	NpcLists=Map.Things.m_lisNpcs--:GetActiveNpcs()
	local localKey=nil
	local localValue=nil
	local num=1
	NpcManagerTitle.NpcList={}
	for localKey, localValue in pairs(NpcLists) do
		NpcManagerTitle.NpcList[num]=NpcLists[localKey]
		NpcManagerTitle:AddChildToList(obj,tostring(num+60000),tostring(num)..": "..tostring(localValue:GetName()))
		num=num+1
	end
end
function NpcManagerTitle:ShowAllRelation(tobj)
	local npc=NpcManagerTitle.chooseNPC
	local sex=true
	if npc.Sex ~= CS.XiaWorld.g_emNpcSex.Male then
		sex=false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Relations"
	NpcLists=NpcMgr.m_mapRelationDefs--:GetActiveNpcs()
	if NpcLists==nil or NpcLists=={} then
		return false
	end
	local localKey=nil
	local localValue=nil
	local num=1
	NpcManagerTitle.RelationLists={}
	for localKey, localValue in pairs(NpcLists) do
		if localValue~=nil then
			NpcManagerTitle.RelationLists[num]=localValue
			if sex then
				NpcManagerTitle:AddChildToList(obj,tostring(num+70000),tostring(num)..": "..tostring(localValue.DisplayNameM))
			else
				NpcManagerTitle:AddChildToList(obj,tostring(num+70000),tostring(num)..": "..tostring(localValue.DisplayNameF))
			end
			num=num+1
		end
	end
	
end
function NpcManagerTitle:AddRelation()
	local npc=NpcManagerTitle.chooseNPC
	local Reation=npc.PropertyMgr.RelationData
	local choosenum=tonumber(NpcManagerTitle.inputRelation.m_title.text)
	if choosenum==nil then
		choosenum=1
		NpcManagerTitle.inputRelation.m_title.text="1"
	end
	local choosenum2=tonumber(NpcManagerTitle.inputRelation1.m_title.text)
	if choosenum2==nil then
		choosenum2=1
		NpcManagerTitle.inputRelation1.m_title.text="1"
	end
	Reation:AddRelationShip(NpcManagerTitle.NpcList[choosenum2],NpcManagerTitle.RelationLists[choosenum].Name)
	return true
end
------------------------------------------------------------------------------------------------------------
function NpcManagerTitle:ShowAllFlag(obj)
	if obj==nil then
		obj=NpcManagerTitle.NpcListCOP
	end
	local localKey=nil
	local localValue=nil
	local num=0
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Flags"
	local list=QFWDlib.NpcSpecailFlag
	for localKey,localValue in pairs(list) do
		if localValue~=nil then
			num=num+1
			NpcManagerTitle:AddChildToList(obj,tostring(num+80000),tostring(num)..": "..tostring(localValue),"")
		end
	end
end
function NpcManagerTitle:ShowMeAllFlag(obj)
	local npc=NpcManagerTitle.chooseNPC
	if obj==nil then
		obj=NpcManagerTitle.AttributeListCOP
	end
	local localKey=nil
	local localValue=nil
	local num=0
	obj.m_list:RemoveChildrenToPool()
	NpcManagerTitle.MySpecalFlag={}
	obj.m_title.text = "NPC flag list"
	local list=QFWDlib.NpcSpecailFlag
	for localKey,localValue in pairs(list) do
		if localValue~=nil then
			if npc:HasSpecialFlag(localValue) then
				num=num+1
				NpcManagerTitle.MySpecalFlag[num]=localValue
				NpcManagerTitle:AddChildToList(obj,tostring(num+90000),tostring(num)..": "..tostring(localValue),"")
			end
		end
	end
end
function NpcManagerTitle:RemoveFlag()
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputRelationf1.m_title.text)
	if num==nil or NpcManagerTitle.MySpecalFlag[num]==nil then
		return false
	end
	if npc:HasSpecialFlag(NpcManagerTitle.MySpecalFlag[num]) then
		npc:RemoveSpecialFlag(NpcManagerTitle.MySpecalFlag[num])
		NpcManagerTitle:ShowMeAllFlag()
		return true
	else
		NpcManagerTitle:ShowMeAllFlag()
		return false
	end
end
function NpcManagerTitle:AddFlag()
	local npc=NpcManagerTitle.chooseNPC
	local num=tonumber(NpcManagerTitle.inputRelationf1.m_title.text)
	local Flag=QFWDlib.NpcSpecailFlag[num]
	if num==nil or Flag==nil or npc:HasSpecialFlag(Flag) then
		NpcManagerTitle:ShowMeAllFlag()
		return false
	end
	npc:AddSpecialFlag(Flag, 1)
	NpcManagerTitle:ShowMeAllFlag()
	return true
end

-----------------------------------------------------------------------------------
function NpcManagerTitle:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function NpcManagerTitle:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManagerTitle:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManagerTitle:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	obj.m_title.text = value
	return obj
end
function NpcManagerTitle:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManagerTitle.ListChildOnClick)
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
function NpcManagerTitle.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	NpcManagerTitle.TheClickBnt = tonumber(Eventss.data.name)
	if NpcManagerTitle.TheClickBnt<10000 then
		NpcManagerTitle.ShowWho=0
	elseif NpcManagerTitle.TheClickBnt<20000 then
		NpcManagerTitle.ShowWho=1
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-10000
	elseif NpcManagerTitle.TheClickBnt<30000 then
		NpcManagerTitle.ShowWho=2
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-20000
	elseif NpcManagerTitle.TheClickBnt<40000 then
		NpcManagerTitle.ShowWho=3
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-30000
	elseif NpcManagerTitle.TheClickBnt<50000 then
		NpcManagerTitle.ShowWho=4
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-40000
	elseif NpcManagerTitle.TheClickBnt<60000 then
		NpcManagerTitle.ShowWho=5
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-50000
	elseif NpcManagerTitle.TheClickBnt<70000 then
		NpcManagerTitle.ShowWho=6
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-60000
	elseif NpcManagerTitle.TheClickBnt<80000 then
		NpcManagerTitle.ShowWho=7
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-70000
	elseif NpcManagerTitle.TheClickBnt<90000 then
		NpcManagerTitle.ShowWho=8
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-80000
	elseif NpcManagerTitle.TheClickBnt<100000 then
		NpcManagerTitle.ShowWho=9
		NpcManagerTitle.TheClickBnt=NpcManagerTitle.TheClickBnt-90000
	
	else
		return
	end
	NpcManagerTitle:SetSetting()
	
end
function NpcManagerTitle:SetSetting()
	local obj=nil
	local objLable=nil
	local types=NpcManagerTitle.ShowWho
	if types==nil or types==0 then
		obj=NpcManagerTitle.inputTatle
		objLable=NpcManagerTitle.ShowLableNpc
	elseif types==1 then
		obj=NpcManagerTitle.inputNeed
		objLable=NpcManagerTitle.ShowLableNeedNpc
	elseif types==2 then
		obj=NpcManagerTitle.inputCMD
		objLable=NpcManagerTitle.ShowLableCMDNpc
	elseif types==3 then
		obj=NpcManagerTitle.inputJob
		objLable=NpcManagerTitle.ShowLableJobNpc
	elseif types==4 then
		obj=NpcManagerTitle.inputRelation
		objLable=NpcManagerTitle.ShowLableRelationNpc
	elseif types==5 then
		obj=NpcManagerTitle.inputRelation1
		objLable=NpcManagerTitle.ShowLableRelationNpcName
	elseif types==6 then
		obj=NpcManagerTitle.inputRelation1
		objLable=NpcManagerTitle.ShowLableRelationNpcName
	elseif types==7 then
		obj=NpcManagerTitle.inputRelation
		objLable=NpcManagerTitle.ShowLableRelationNpc
	elseif types==8 then
		obj=NpcManagerTitle.inputRelationf1
	elseif types==9 then
		obj=NpcManagerTitle.inputRelationf1
	end
	if types==nil or types==0 then
		local chooseTitle=NpcManagerTitle.allTatleList[tonumber(NpcManagerTitle.TheClickBnt)]
		local DisplayName=chooseTitle.title
		if DisplayName==nil then
			DisplayName=chooseTitle.Id
		end
		objLable.text="Current title: "..tostring(DisplayName)
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
	elseif types==1 then
		objLable.text="Current need: "..tostring(NpcManagerTitle.allNeedListName[NpcManagerTitle.TheClickBnt])
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
	elseif types==2 then
		objLable.text="Current CMD: "..tostring(NpcManagerTitle.allCMDListName[NpcManagerTitle.TheClickBnt])
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
	elseif types==3 then
		if NpcManagerTitle.JobBaseType~=0 and NpcManagerTitle.JobBaseType~=nil then
			objLable.text="Current job: "..tostring(NpcManagerTitle.allFoundJobBaseNameList[NpcManagerTitle.TheClickBnt])
		else
			objLable.text="Current job: "..tostring(NpcManagerTitle.allJobListName[NpcManagerTitle.TheClickBnt])
		end
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
		NpcManagerTitle:ShowJobListSX()
	elseif types==4 then
		objLable.text="Current relation: "..tostring(NpcManagerTitle.allRelationListName[NpcManagerTitle.TheClickBnt])
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
		NpcManagerTitle:ShowRelationList2(tobj)
	elseif types==5 then
		objLable.text="Current NPC: "..tostring(NpcManagerTitle.allRelationListNPCName[NpcManagerTitle.TheClickBnt])
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
		--NpcManagerTitle:ShowRelationList2(tobj)
	elseif types==6 then
		objLable.text="Current NPC: "..tostring(NpcManagerTitle.NpcList[NpcManagerTitle.TheClickBnt]:GetName())
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
		--NpcManagerTitle:ShowRelationList2(tobj)
	elseif types==7 then
		objLable.text="Current relationship: "..tostring(NpcManagerTitle.RelationLists[NpcManagerTitle.TheClickBnt].DisplayNameM)
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
		--NpcManagerTitle:ShowRelationList2(tobj)
	elseif types==8 then
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
		--NpcManagerTitle:ShowRelationList2(tobj)
	elseif types==9 then
		obj.m_title.text=tostring(NpcManagerTitle.TheClickBnt)
	end
end
