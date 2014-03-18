---
layout: post
title: "Update AppSettings and custom configuration sections in App.config at runtime"
description: "How to update (add, edit or remove) AppSettings
and custom config sections in App.config at runtime."
category: articles
tags: [c#, .net]
alias: [/2013/08/31/]
utilities: highlight, toc
---
This post shows how to update (add, edit or remove) `AppSettings`
and custom config sections in `App.config` at runtime.

<div id="toc"></div>

## <a id="app-config"></a>App.config file

Sample `App.config` file:

{% highlight xml %}
﻿﻿<?xml version="1.0" encoding="utf-8" ?>
<configuration>
	<configSections>
		<sectionGroup name="geoSettings">
			<section name="summary" type="System.Configuration.NameValueSectionHandler" />
		</sectionGroup>
	</configSections>

	<appSettings>
		<add key="Language" value="Ruby" />
		<add key="Version" value="1.9.3" />
	</appSettings>

	<geoSettings>
		<summary>
			<add key="Country" value="New Zealand" />
			<add key="City" value="Christchurch" />
		</summary>
	</geoSettings>
</configuration>
{% endhighlight %}

## <a id="update-appsettings"></a>Update AppSettings

### <a id="add-in-appsettings"></a>Add a new key

{% prettify c# %}
var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
config.AppSettings.Settings.Add("OS", "Linux");
config.Save(ConfigurationSaveMode.Modified);

ConfigurationManager.RefreshSection("appSettings");
{% endprettify %}

### <a id="edit-in-appsettings"></a>Edit an existing key's value

{% prettify c# %}
var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
config.AppSettings.Settings["Version"].Value = "2.0.0";
config.Save(ConfigurationSaveMode.Modified);

ConfigurationManager.RefreshSection("appSettings");
{% endprettify %}

### <a id="remove-in-appsettings"></a>Delete an existing key

{% prettify c# %}
var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
config.AppSettings.Settings.Remove("Version");
config.Save(ConfigurationSaveMode.Modified);

ConfigurationManager.RefreshSection("appSettings");
{% endprettify %}

## <a id="update-custom-section"></a>Update custom configuration sections

### <a id="add-in-custom-section"></a>Add a new key

{% prettify c# %}
var xmlDoc = new XmlDocument();
xmlDoc.Load(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);

// create new node <add key="Region" value="Canterbury" />
var nodeRegion = xmlDoc.CreateElement("add");
nodeRegion.SetAttribute("key", "Region");
nodeRegion.SetAttribute("value", "Canterbury");

xmlDoc.SelectSingleNode("//geoSettings/summary").AppendChild(nodeRegion);
xmlDoc.Save(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);

ConfigurationManager.RefreshSection("geoSettings/summary");
{% endprettify %}

### <a id="edit-in-custom-section"></a>Edit an existing key's value

{% prettify c# %}
var xmlDoc = new XmlDocument();
xmlDoc.Load(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);

xmlDoc.SelectSingleNode("//geoSettings/summary/add[@key='Country']").Attributes["value"].Value = "Old Zeeland";
xmlDoc.Save(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);

ConfigurationManager.RefreshSection("geoSettings/summary");
{% endprettify %}

### <a id="remove-in-custom-section"></a>Delete an existing key

{% prettify c# %}
var xmlDoc = new XmlDocument();
xmlDoc.Load(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);

XmlNode nodeCity = xmlDoc.SelectSingleNode("//geoSettings/summary/add[@key='City']");
nodeCity.ParentNode.RemoveChild(nodeCity);

xmlDoc.Save(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile);
ConfigurationManager.RefreshSection("geoSettings/summary");
{% endprettify %}

## <a id="print-out-keys"></a>Print out all keys

{% prettify c# %}
NameValueCollection appSettings = ConfigurationManager.AppSettings;
// var customSettings = ConfigurationManager.GetSection("geoSettings/summary") as NameValueCollection;

foreach (string key in appSettings.AllKeys) {
	Console.WriteLine("{0}: {1}", key, section[key]);
}
{% endprettify %}

## <a id="references"></a>References

1. [Modifying app.config at runtime throws exception](http://stackoverflow.com/q/8807218/1177636)
2. [update app.config file programatically with ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);](http://stackoverflow.com/q/8522912/1177636)
3. [Opening the machine/base Web.Config (64bit) through code](http://stackoverflow.com/q/8130085/1177636)