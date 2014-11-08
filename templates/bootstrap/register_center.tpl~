{************************************
****** Registration Template ********
*************************************}
<!-- register_center.tpl -->
<div class="row register-wrapper">
	<div class="col-md-4 register-left">
		{checkActionsTpl location="tpl_pligg_register_start"}
		<form action="{$URL_register}" class="form-horizontal" method="post" id="thisform">
			<div class="control-group">
				<label class="control-label">{#PLIGG_Visual_Register_Username#}</label>
				<div class="controls">
					{if isset($form_username_error)}
						{ foreach value=error from=$form_username_error }
							<div style="margin:10px 0 0 0;" class="alert alert-danger">
								<button class="close" data-dismiss="alert">&times;</button>
								{$error}
							</div>
						{ /foreach }
					{/if}
					<input autofocus="autofocus" type="text" class="form-control reg_username" id="reg_username" name="reg_username" value="{if isset($reg_username)}{$reg_username}{/if}" size="25" tabindex="10" maxlength="32"/>
					<br/><span class="reg_usernamecheckitvalue"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">{#PLIGG_Visual_Register_Email#}</label>
				<div class="controls">
					{if isset($form_email_error)}
						{ foreach value=error from=$form_email_error }
							<div style="margin:10px 0 0 0;" class="alert alert-danger">
								<button class="close" data-dismiss="alert">&times;</button>
								{$error}
							</div>
						{ /foreach }
					{/if}
					<input type="text" class="form-control reg_email" id="reg_email" name="reg_email" value="{if isset($reg_email)}{$reg_email}{/if}" tabindex="12" maxlength="128"/>
					<br/><span class="reg_emailcheckitvalue"></span>
					{* <p class="help-inline">{#PLIGG_Visual_Register_Lowercase#}</p> *}
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">{#PLIGG_Visual_Register_Password#}</label>
				<div class="controls">
					{if isset($form_password_error)}
						{ foreach value=error from=$form_password_error }
							<div style="margin:10px 0 0 0;" class="alert alert-danger">
								<button class="close" data-dismiss="alert">&times;</button>
								{$error}
							</div>
						{ /foreach }
					{/if}
					<input type="password" class="form-control" id="reg_password" name="reg_password" value="{if isset($reg_password)}{$reg_password}{/if}" size="25" tabindex="14"/>
					<p class="help-inline">{#PLIGG_Visual_Register_FiveChar#}</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">{#PLIGG_Visual_Register_Verify_Password#}</label>
				<div class="controls">
					<input type="password" class="form-control" id="reg_verify" name="reg_password2" value="{if isset($reg_password2)}{$reg_password2}{/if}" size="25" tabindex="15"/>
				</div>
			</div>
			{if isset($register_step_1_extra)}
				{$register_step_1_extra}
			{/if}
			<div class="form-actions">
				<input type="submit" name="submit" value="{#PLIGG_Visual_Register_Create_User#}" class="btn btn-primary reg_submit" tabindex="16" />
				<input type="hidden" name="regfrom" value="full" />
			</div>
		</form>
	</div><!--/.register-left -->
	<div class="col-md-8 register-right">
		<h2>{#PLIGG_Visual_Register_Description_Title#}</h2>
		<h4>Being Social is a online social networking platform for civic action. The site uses the power of the internet to 
connect people nationally, and helps them discuss and act on their civic issues. By helping people come together and collaborate 
as an online community, it transforms citizens into change agents.Fixing our drains, our roads, our garbage, our water, our traffic, therefore, 
is fixing the nuts and bolts of our democracy. It takes the ideals of democracy into the realm of concrete action. 
And this is what Being Social is all about; active citizenship to facilitate action, and to bring about change on the ground. 
Don't just read the problems, opinion.
submit your own if you have. By registering you unlock special privileges reserved for members such as...<br>
			<ul>
				{#PLIGG_Visual_Register_Description_Points#}
			</ul>
		</h4>
	</div>
	{checkActionsTpl location="tpl_pligg_register_end"}
</div><!--/.register-wrapper -->
<!--/register_center.tpl -->