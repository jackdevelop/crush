local GameUtil = {};


--[[
 设置sprite全屏显示
@param sprite 此sprite的图片大小最好是960*720
]]
function GameUtil.spriteFullScreen(sprite)
	local size=sprite:getContentSize();
	local screenSize=display.size;
	local scalX=screenSize.width/size.width;
	local scalY=screenSize.height/size.height;
	sprite:setScaleX(scalX);
	sprite:setScaleY(scalY);
end




--格式化时间
--[[
格式化时间
单位缩写：d H m s 
@param int second 秒
@param bool long 是否长格式(默认短格式)
@return string
]]
function GameUtil.formatTime(second, long)
--	local d = --Language.getValueByKey(35)
	local h = "时"--Language.getValueByKey(36)
	local m = "分"--Language.getValueByKey(37)
	local s = "秒"--Language.getValueByKey(38)
    local arr = {
--        {d, math.floor(second / 86400)}, -- 天
        {h, math.floor(second % 86400 / 3600)}, -- 时
        {m, math.floor(second % 3600 / 60)}, -- 分
        {s, second % 60}, -- 秒
    }



    local tmpArr = {}
    for i, v in ipairs(arr) do
        if v[2] > 0 then
            tmpArr[#tmpArr + 1] = v[2] .. v[1]
            if not long and #tmpArr >= 2 then -- 短格式(最多显示2个最大单位)
                break
            end
        end
    end
    return table.concat(tmpArr,"")
end






--添加背景的局部函数
function GameUtil.addBackgroundImage(currentParent,currentImageName)
	if currentImageName then 
		cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2D_PIXEL_FORMAT_RGB565);
	    local sprite = display.newSprite(currentImageName)
	    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2D_PIXEL_FORMAT_RGBA8888);
	    local function backGroundSpriteHandle(event)
	    	if event.name == "exit" then
	            display.removeSpriteFrameByImageName(currentImageName)
	        end
	    end
		sprite:addNodeEventListener(cc.NODE_EVENT,backGroundSpriteHandle)-- 地图对象删除时，自动从缓存里卸载地图材质
	    
	    --[[
	    if width then self.backgroundSprite_:setContentSize(CCSize(width,height)); end
		local contentSize=sprite:getContentSize();
		if not width then
			width = contentSize.width;
			height= contentSize.height;
		end
		]]
		
		sprite:align(display.LEFT_BOTTOM, 0, 0)
	    currentParent:addChild(sprite)
	   
	    return sprite;
    end
end











return GameUtil;