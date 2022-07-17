<%@ Control Language="VB" AutoEventWireup="false" CodeFile="slide.ascx.vb" Inherits="usercontrol_slide" %>
<div id="esTopStories">
    <div section="item-1" class="col-3 asset label">
        <a runat="server" id="A1" target="_blank">
            <asp:Image ID="img1" Style="width: 100%;" runat="server"></asp:Image>
            <div class="content" style="padding-bottom: 10px;">
                <div class="meta" style="font-size: 11px; font-family: Tahoma; background-color: #44B0C5;">
                    <a style="color: White; text-decoration: none;" runat="server" id="AA1" target="_blank">
                        <asp:Label ID="lblType1" runat="server"></asp:Label></a>
                </div>
                <a runat="server" id="A11" target="_blank" class="w">
                    <h3 class="h" style="font-size: 15px; font-family: koodakAnd;">
                        <asp:Label ID="lblTitle1" runat="server"></asp:Label>
                    </h3>
                </a><a runat="server" id="A111" target="_blank" class="w">
                    <p style="font-size: 11px; font-family: Tahoma;">
                        <asp:Label ID="lblDetail1" runat="server"></asp:Label>
                    </p>
                </a>
            </div>
        </a>
    </div>
    <div section="item-2" class="col-3 asset label">
        <a runat="server" id="A2" target="_blank">
            <asp:Image ID="img2" Style="width: 100%;" runat="server"></asp:Image>
            <div class="content" style="padding-bottom: 10px;">
                <div class="meta" style="font-size: 11px; font-family: Tahoma; background-color: #44B0C5;">
                    <a style="color: White; text-decoration: none;" runat="server" id="AA2" target="_blank">
                        <asp:Label ID="lblType2" runat="server" /></a>
                </div>
                <a runat="server" id="A22" target="_blank" class="w">
                    <h3 class="h" style="font-size: 15px; font-family: koodakAnd;">
                        <asp:Label ID="lblTitle2" runat="server"></asp:Label>
                    </h3>
                </a><a runat="server" id="A222" target="_blank" class="w">
                    <p style="font-size: 11px; font-family: Tahoma;">
                        <asp:Label ID="lblDetail2" runat="server"></asp:Label>
                    </p>
                </a>
            </div>
        </a>
    </div>
    <div section="item-3" class="col-3 asset label">
        <a runat="server" id="A3" target="_blank">
            <asp:Image ID="img3" Style="width: 100%;" runat="server"></asp:Image>
            <div class="content" style="padding-bottom: 10px;">
                <div class="meta" style="font-size: 11px; font-family: Tahoma; background-color: #44B0C5;">
                    <a style="color: White; text-decoration: none;" runat="server" id="AA3" target="_blank">
                        <asp:Label ID="lblType3" runat="server" /></a>
                </div>
                <a runat="server" id="A33" target="_blank" class="w">
                    <h3 class="h" style="font-size: 15px; font-family: koodakAnd;">
                        <asp:Label ID="lblTitle3" runat="server"></asp:Label>
                    </h3>
                </a><a runat="server" id="A333" target="_blank" class="w">
                    <p style="font-size: 11px; font-family: Tahoma;">
                        <asp:Label ID="lblDetail3" runat="server"></asp:Label>
                    </p>
                </a>
            </div>
        </a>
    </div>
</div>
<style>
    .w
    {
        text-decoration: none;
        color:White;
    }
</style>
<style>

#esTopStories .content .meta,#masonryRiver .article .assetThumb span,#masonryRiver .review .assetThumb span,#masonryRiver .image .assetThumb span,#masonryRiver .video .assetThumb span,#masonryRiver .howto .assetThumb span
{
	box-shadow: 0 1px rgba(255,255,255,0.2) inset;
	color: #fff;
	display: inline-block;
	line-height: 1em;
	moz-box-shadow: 0 1px rgba(255,255,255,0.2) inset;
	padding: 10px;
	text-shadow: 0 1px 0 rgba(0,0,0,0.4);
	text-transform: uppercase;
	webkit-box-shadow: 0 1px rgba(255,255,255,0.2) inset;
	
}

.social-button.hover,.social-button.hover .icon,.social-button-small,.social-button-small .icon,.imageLinkWrapper figure:before,#esTopStories .content,#esTopStories .content .meta,#esTopStories .content .h,#esTopStories .content .share,#esTopStories .asset,#esTopStories .asset:before,#esTopStories .asset:hover,#esTopStories .asset:hover .content,#esTopStories .asset:hover .content .h,#esTopStories .asset:hover .content .share,#esTopStories .asset:hover .content .meta,#masonryRiver .riverPost .socialSharingSmall,.touch-disabled #masonryRiver .riverPost .img:after,.touch-disabled #masonryRiver .riverPost:hover .socialSharingSmall,.touch-disabled #masonryRiver .riverPost:hover .img:after,#esNav .tab .hedWrap,#esNav .tab .hedWrap.selected,#esNav .tab .hedWrap:hover,#esNav .accordion-content li,#esNav .accordion-content li:hover
{
	moz-transition-duration: 0.2s;
	moz-transition-property: all;
	moz-transition-timing-function: ease;
	o-transition-duration: 0.2s;
	o-transition-property: all;
	o-transition-timing-function: ease;
	transition-duration: 0.2s;
	transition-property: all;
	transition-timing-function: ease;
	webkit-transition-duration: 0.2s;
	webkit-transition-property: all;
	webkit-transition-timing-function: ease;
	
}
#esNav .tab .hed
{
	moz-transition-property: color;
	o-transition-property: color;
	transition-property: color;
	webkit-transition-property: color;
}
.imageLinkWrapper figure
{
	position: relative;
}
.imageLinkWrapper figure:before
{
	box-shadow: 0 0 15px rgba(0,0,0,0.3) inset;
	content: "";
	display: block;
	height: 100%;
	left: 0;
	moz-box-shadow: 0 0 15px rgba(0,0,0,0.3) inset;
	position: absolute;
	top: 0;
	webkit-box-shadow: 0 0 15px rgba(0,0,0,0.3) inset;
	width: 100%;
	z-index: 2;
}
.imageLinkWrapper figure img
{
	display: block;
	max-width: 100%;
	position: relative;
	z-index: 1;
}
.imageLinkWrapper .headline
{
	color: #000;
	float: left;
	font-size: .941em;
	line-height: 1.125em;
	margin: 10px 0 0;
}
#esTopStories
{
	height: 330px;

	overflow: hidden;
	position: relative;
	width: 100%;
}
#esTopStories .content
{
	color: #fff;
	left: 30px;
	padding-right: 30px;
	position: absolute;
}
#esTopStories .content .meta
{
	background: rgba(134,0,0,0.8);
	font-size: 0.70588em;
	line-height: 1em;
	margin-bottom: 10px;
	padding: 10px 20px;
	position: relative;
}
#esTopStories .content .h
{
	color: #fff;
	font-family: Jubilat,Georgia,Times,"Times New Roman",serif;
	font-size: 1.52941em;
	font-weight: 400;
	line-height: 1.07692em;
	text-shadow: 0 1px #000;
}
#esTopStories .content p
{
	display: none;
	font-size: 0.94118em;
	line-height: 1.25em;
	padding-top: 5px;
}
#esTopStories .content .share
{
	height: 33px;
	opacity: 0;
	position: relative;
	z-index: 10;
}
#esTopStories .content .share li
{
	display: none;
	float: left;
	height: 33px;
	position: relative;
	width: 33px;
}
#esTopStories .asset
{
	height: 100%;
	margin-left: 0;
	overflow: hidden;
	width: 33.333333%;
}
#esTopStories .asset:before
{
	content: "";
	display: block;
	height: 100%;
	position: absolute;
	width: 100%;
}
#esTopStories .asset figure:after
{
	background: linear-gradient(top, rgba(0,0,0,0.7),rgba(0,0,0,0) 8%);
	background: -moz-linear-gradient(top, rgba(0,0,0,0.7),rgba(0,0,0,0) 8%);
	background: -o-linear-gradient(top, rgba(0,0,0,0.7),rgba(0,0,0,0) 8%);
	background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, rgba(0,0,0,0.7)), color-stop(8%, rgba(0,0,0,0)));
	background: -webkit-linear-gradient(top, rgba(0,0,0,0.7),rgba(0,0,0,0) 8%);
	content: "";
	display: block;
	height: 100%;
	position: absolute;
	top: 0;
	width: 100%;
}
#esTopStories .asset figure:before
{
	background: linear-gradient(transparent,#000000 120%);
	background: -moz-linear-gradient(transparent,#000000 120%);
	background: -o-linear-gradient(transparent,#000000 120%);
	background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, transparent), color-stop(120%, #000000));
	background: -webkit-linear-gradient(transparent,#000000 120%);
	bottom: 0;
	content: "";
	display: block;
	height: 100%;
	position: absolute;
	width: 100%;
}
#esTopStories .asset.label .content
{
	bottom: 0;
}
#esTopStories .asset.label:hover .content
{
	bottom: 30px;
}
#esTopStories .asset:hover
{
	box-shadow: 0 1px 6px rgba(0,0,0,0.3),1px 0 rgba(255,255,255,0.3),-1px 0 rgba(255,255,255,0.3),0 0 10px 2px #ff8b00;
	moz-box-shadow: 0 1px 6px rgba(0,0,0,0.3),1px 0 rgba(255,255,255,0.3),-1px 0 rgba(255,255,255,0.3),0 0 10px 2px #ff8b00;
	webkit-box-shadow: 0 1px 6px rgba(0,0,0,0.3),1px 0 rgba(255,255,255,0.3),-1px 0 rgba(255,255,255,0.3),0 0 10px 2px #ff8b00;
	z-index: 3;
}
#esTopStories .asset:hover:before
{
	background-color: rgba(0,0,0,0.4);
}
#esTopStories .asset:hover .content p
{
	display: block;
}
#esTopStories .asset:hover .content .share
{
	display: none;
	opacity: 1;
}
#esTopStories .asset:hover .content .meta
{
	opacity: 1;
}

@media (max-width: 1360px)
{
	body #esTopStories
	{
		height: 252px;
	}
	body #esTopStories .content
	{
		left: 20px;
	}
	body #esTopStories .asset.label .content
	{
		left: 20px;
		padding-right: 20px;
	}
	body #esTopStories .asset.label .h
	{
		font-size: 1.29412em;
		line-height: 1.18182em;
	}
	body #esTopStories .asset.label .meta
	{
		padding: 10px 20px;
	}
	body #esTopStories .asset.label:hover .content
	{
		bottom: 20px;
	}
}

[class|="col"]
{
	box-sizing: border-box;
	float: left;
	margin-left: 0;
	moz-box-sizing: border-box;
	webkit-box-sizing: border-box;
	
}

.col-3
{
	position: relative;
	width: 270px;
	background-color:#7A7A7A;
}
</style>