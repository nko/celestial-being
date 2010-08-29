dependencies = {
	layers: [
		{
			name: "dojo.js",
			dependencies: [

				"dijit.layout.ContentPane",
				"dijit.layout.BorderContainer",
				"dijit.layout.TabContainer",
				"dijit.layout.AccordionContainer",
				
				"dijit.MenuBar",
				"dijit.PopupMenuBarItem",
				"dijit.Menu",
				"dijit.MenuItem",
				"dijit.PopupMenuItem",
				"dijit.TitlePane",
				"dijit.Toolbar",
				"dijit.form.Button",
				
				"dijit.Toolbar",
				"dijit.form.DropDownButton",
				"dijit.TooltipDialog",
				"dijit.form.TextBox",

				'dijit._Widget',
				'dojo.window',
				
				'dojox.dtl._DomTemplated',
				"dojox.dtl",
				"dojox.dtl.Context",
				"dojox.dtl.filter.lists",
				"dojox.dtl.tag.logic",
				"dojox.dtl.filter.dates",
				"dojox.dtl.utils.date",
				"dojox.dtl.filter.strings",
				"dojox.dtl.filter.htmlstrings",
				
        'TweetIRC.Kernel',
        'TweetIRC.ChatRoom',
        'TweetIRC.plugins.BasePlugin',
        'TweetIRC.plugins.ChatRoomPlugin'
			]
		}
	],

	prefixes: [
		[ "dijit", "../dijit" ],
		[ "dojox", "../dojox" ],
		[ "TweetIRC", "/home/zemanel/Dropbox/NodeKnockout/Project/Deploy/Resources/js/TweetIRC" ]
	]
}
