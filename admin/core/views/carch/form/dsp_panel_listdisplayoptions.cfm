<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

	/admin/
	/core/
	/Application.cfc
	/index.cfm

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfset tabList=listAppend(tabList,"tabListDisplayOptions")>
<cfoutput>
<div class="mura-panel panel">
	<div class="mura-panel-heading" role="tab" id="heading-listdisplayoptions">
		<h4 class="mura-panel-title">
			<a class="collapse" role="button" data-toggle="collapse" data-parent="##content-panels" href="##panel-listdisplayoptions" aria-expanded="false" aria-controls="panel-listdisplayoptions">#application.rbFactory.getKeyValue(session.rb,"sitemanager.content.tabs.listdisplayoptions")#</a>
		</h4>
	</div>
	<div id="panel-listdisplayoptions" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-listdisplayoptions" aria-expanded="false" style="height: 0px;">
		<div class="mura-panel-body">

			<span id="extendset-container-tablistdisplayoptionstop" class="extendset-container"></span>

			<div class="mura-control-group">
		  	<label>#application.rbFactory.getKeyValue(session.rb,'collections.imagesize')#</label>
				<select name="imageSize" data-displayobjectparam="imageSize" onchange="if(this.value=='custom'){jQuery('##feedCustomImageOptions').fadeIn('fast')}else{jQuery('##feedCustomImageOptions').hide();jQuery('##feedCustomImageOptions').find(':input').val('AUTO');}">
				<cfloop list="Small,Medium,Large" index="i">
					<option value="#lcase(i)#"<cfif i eq rc.contentBean.getImageSize()> selected</cfif>>#I#</option>
				</cfloop>

				<cfset imageSizes=application.settingsManager.getSite(rc.siteid).getCustomImageSizeIterator()>
										
				<cfloop condition="imageSizes.hasNext()">
					<cfset image=imageSizes.next()>
					<option value="#lcase(image.getName())#"<cfif image.getName() eq rc.contentBean.getImageSize()> selected</cfif>>#esapiEncode('html',image.getName())#</option>
				</cfloop>
					<option value="custom"<cfif "custom" eq rc.contentBean.getImageSize()> selected</cfif>>Custom</option>
			</select>
		</div>

		<div id="feedCustomImageOptions" class="mura-control-group"<cfif rc.contentBean.getImageSize() neq "custom"> style="display:none"</cfif>>
			<span class="half">
	      <label>#application.rbFactory.getKeyValue(session.rb,'collections.imagewidth')#</label>
				<input name="imageWidth" data-displayobjectparam="imageWidth" type="text" value="#rc.contentBean.getImageWidth()#" />
			</span>
			<span class="half">
	      <label>#application.rbFactory.getKeyValue(session.rb,'collections.imageheight')#</label>
	    	<input name="imageHeight" data-displayobjectparam="imageHeight" type="text" value="#rc.contentBean.getImageHeight()#" />
			</span>
		</div>

			<div class="mura-control-group" id="availableFields">
			<label>
				<span class="half">Available Fields</span> <span class="half">Selected Fields</span>
			</label>
		
			<div id="sortableFields">
			<p class="dragMsg">
				<span class="dragFrom half">Drag Fields from Here&hellip;</span><span class="half">&hellip;and Drop Them Here.</span>
			</p>							
		
			<cfset displayList=rc.contentBean.getDisplayList()>
			<cfset availableList=rc.contentBean.getAvailableDisplayList()>		
			<ul id="contentAvailableListSort" class="contentDisplayListSortOptions">
				<cfloop list="#availableList#" index="i">
					<li class="ui-state-default">#trim(i)#</li>
				</cfloop>
			</ul>
			<ul id="contentDisplayListSort" class="contentDisplayListSortOptions">
				<cfloop list="#displayList#" index="i">
					<li class="ui-state-highlight">#trim(i)#</li>
				</cfloop>
			</ul>
			<input type="hidden" id="contentDisplayList" value="#displayList#" name="displayList"/>			
			<script>
				//Removed from jQuery(document).ready() because it would not fire in ie7 frontend editing.
				siteManager.setContentDisplayListSort();
			</script>
		</div>
    </div>

		<div class="mura-control-group">
			<label>#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.recordsperpage')#</label> 
			<select name="nextN" class="dropdown">
				<cfloop list="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25,50,100" index="r">
					<option value="#r#" <cfif r eq rc.contentBean.getNextN()>selected</cfif>>#r#</option>
				</cfloop>
			</select>
		</div>

		<span id="extendset-container-listdisplayoptions" class="extendset-container"></span>
		<span id="extendset-container-tablistdisplayoptionsbottom" class="extendset-container"></span>

	</div>
	</div>
</div>
</cfoutput>