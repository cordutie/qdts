{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 408.0, -993.0, 993.0, 959.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 16,
					"outlettype" : [ "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float" ],
					"patching_rect" : [ 240.789999999999992, 69.450000000000003, 261.0, 22.0 ],
					"text" : "unpack 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-9",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 738.799999999999955, 128.419999999999987, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 884.0, 176.0, 186.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "visual_feedback_linked_sliders",
						"parameter_enable" : 0
					}
,
					"text" : "js visual_feedback_linked_sliders"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 884.0, 146.0, 75.0, 22.0 ],
					"text" : "r ---N-sliders"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 707.0, 226.0, 29.5, 22.0 ],
					"text" : "!- 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 707.0, 252.0, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.39 ],
					"bordercolor" : [ 0.262745098039216, 0.462745098039216, 0.847058823529412, 0.0 ],
					"hidden" : 1,
					"id" : "obj-41",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 92.857144296169281, 241.269845008850098, 346.047623991966248, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 1.0, 231.0, 69.0 ],
					"proportion" : 0.5,
					"varname" : "inactive_area"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 276.619052231311798, 428.0, 75.0, 22.0 ],
					"text" : "r ---N-sliders"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 277.769845008850098, 77.0, 22.0 ],
					"text" : "s ---N-sliders"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 585.0, 252.0, 75.0, 22.0 ],
					"text" : "s ---link_to_f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 585.0, 228.0, 44.0, 15.0 ],
					"pictures" : [ "link.svg", "link.svg" ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "live.text[1]",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "live.text[1]",
							"parameter_type" : 2
						}

					}
,
					"usepicture" : 1,
					"varname" : "live.text[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 225.5, 23.0, 20.0 ],
					"text" : "N"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ -163.0, 322.0, 29.5, 22.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ -163.0, 354.0, 34.0, 22.0 ],
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ -103.0, 404.0, 29.5, 22.0 ],
					"text" : "f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ -103.0, 363.0, 61.0, 22.0 ],
					"text" : "change 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 560.0, 343.0, 73.0, 22.0 ],
					"text" : "r ---link_to_f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ -120.0, 594.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "float" ],
					"patching_rect" : [ -153.0, 466.0, 40.0, 22.0 ],
					"text" : "t b b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ -142.0, 506.0, 41.0, 22.0 ],
					"text" : "uzi 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -120.0, 547.0, 167.0, 22.0 ],
					"text" : "sprintf script send h%d set %f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -162.0, 283.0, 73.0, 22.0 ],
					"text" : "r ---link_to_f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -153.0, 436.0, 69.0, 22.0 ],
					"text" : "gate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 616.0, 464.0, 41.0, 22.0 ],
					"text" : "uzi 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 638.0, 495.0, 200.0, 22.0 ],
					"text" : "sprintf script send h%d ignoreclick 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 501.0, 459.0, 57.0, 33.0 ],
					"text" : "enable clicking "
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 560.0, 464.0, 41.0, 22.0 ],
					"text" : "uzi 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 560.0, 407.0, 132.0, 22.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 582.0, 527.0, 200.0, 22.0 ],
					"text" : "sprintf script send h%d ignoreclick 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 560.0, 195.0, 69.0, 22.0 ],
					"text" : "route N link"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-10",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 560.0, 125.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 63.492064476013184, 129.365081369876862, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 16,
					"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang" ],
					"patching_rect" : [ 63.492064476013184, 205.555558741092682, 454.714292466640472, 22.0 ],
					"text" : "t b b b b b b b b b b b b b b b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 165.079367637634277, 473.015880346298218, 114.301588654518127, 20.0 ],
					"text" : "Resend Values"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 100.793652355670929, 505.555563390254974, 82.539683818817139, 33.0 ],
					"text" : "Update list size"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-93",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 63.492064476013184, 723.015884220600128, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 355.0, 577.0, 104.761906385421753, 20.0 ],
					"text" : "Show 1 to N-1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 203.968257129192352, 576.984135925769806, 82.539683818817139, 20.0 ],
					"text" : "hide all first"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 313.0, 521.0, 29.5, 22.0 ],
					"text" : "- 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "float", "float", "bang" ],
					"patching_rect" : [ 277.0, 459.523816645145416, 74.619052231311798, 22.0 ],
					"text" : "t b f f b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 334.0, 603.0, 132.0, 22.0 ],
					"text" : "sprintf script show h%d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 313.0, 547.0, 40.0, 22.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 313.0, 576.0, 40.0, 22.0 ],
					"text" : "uzi"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 181.746034562587738, 603.174612522125244, 127.0, 22.0 ],
					"text" : "sprintf script hide h%d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 159.523811995983124, 576.190485119819641, 41.0, 22.0 ],
					"text" : "uzi 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 63.492064476013184, 537.301595628261566, 45.0, 22.0 ],
					"text" : "zl.slice"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 16,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 63.492064476013184, 349.20635461807251, 454.515879765152931, 22.0 ],
					"text" : "pak 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 449.841277122497559, 686.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-8",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 499.206356942653656, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 438.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h15",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h15",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h15"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-1",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 469.841277122497559, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 409.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h14",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h14",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h14"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-2",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 440.476197302341461, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 379.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h13",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h13",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h13"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-3",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 411.904768288135529, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 350.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h12",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h12",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h12"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-4",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 382.539688467979431, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 321.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h11",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h11",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h11"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-5",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 353.968259453773499, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 292.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h10",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h10",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h10"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"hidden" : 1,
					"id" : "obj-6",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 324.603179633617401, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 263.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h9",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h9",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h9"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-7",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 296.031750619411469, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 234.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h8",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h8",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h8"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-23",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 266.666670799255371, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 205.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h7",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h7",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h7"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-31",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 238.095241785049438, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h6",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h6",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h6"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-32",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 208.730161964893341, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 146.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h5",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h5",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h5"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-34",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 180.158732950687408, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 117.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h4",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h4",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h4"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-21",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 150.793653130531311, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h3",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h3",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h3"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-22",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 122.222224116325378, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h2",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h2",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h2"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-20",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 92.857144296169281, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "h1",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "h1",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "h1"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
					"annotation_name" : "Target Amplitudes",
					"focusbordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 63.492064476013184, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 1.0, 27.0, 69.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Amplitudes",
							"parameter_info" : "Amplitude of the Nth harmonic in the target psychoacoustically perceived spectrum\n",
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "f",
							"parameter_mmax" : 2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "f",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"textcolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tribordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"tricolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"trioncolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
					"varname" : "f"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 14 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 591.5, 654.890625, 459.341277122497559, 654.890625 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 72.992064476013184, 345.09765625, 0.0, 345.09765625, 0.0, 345.0, -93.5, 345.0 ],
					"order" : 1,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"order" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-19", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 13 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 1 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 3 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 2 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 7 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-25", 14 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-25", 13 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-25", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-25", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-25", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-25", 12 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-25", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-25", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-25", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-25", 11 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-25", 10 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-25", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-25", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-25", 15 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 647.5, 656.3671875, 459.341277122497559, 656.3671875 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-27", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 12 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 6 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 5 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 4 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ -153.5, 396.0, -93.5, 396.0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-39", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 11 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 1 ],
					"midpoints" : [ -122.5, 497.0703125, 37.5, 497.0703125 ],
					"source" : [ "obj-44", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-44", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ -143.5, 499.01953125, -166.828125, 499.01953125, -166.828125, 189.69140625, 72.992064476013184, 189.69140625 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 10 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 191.246034562587738, 655.587306261062622, 459.341277122497559, 655.587306261062622 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 9 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 343.5, 655.587306261062622, 459.341277122497559, 655.587306261062622 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 1 ],
					"source" : [ "obj-63", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-64", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 8 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 286.5, 492.271949223009869, 45.478670409880579, 492.271949223009869, 45.478670409880579, 345.0, 72.992064476013184, 345.0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 1 ],
					"midpoints" : [ 305.039684077103914, 507.0, 98.992064476013184, 507.0 ],
					"source" : [ "obj-75", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 342.119052231311798, 513.886283992091194, 169.023811995983124, 513.886283992091194 ],
					"source" : [ "obj-75", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-75", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 15 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 1,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"order" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-96", 14 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-96", 13 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-96", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-96", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-96", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-96", 12 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-96", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-96", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-96", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-96", 11 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-96", 10 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-96", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-96", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-96", 15 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1" : [ "h14", "h14", 0 ],
			"obj-15" : [ "f", "f", 0 ],
			"obj-2" : [ "h13", "h13", 0 ],
			"obj-20" : [ "h1", "h1", 0 ],
			"obj-21" : [ "h3", "h3", 0 ],
			"obj-22" : [ "h2", "h2", 0 ],
			"obj-23" : [ "h7", "h7", 0 ],
			"obj-3" : [ "h12", "h12", 0 ],
			"obj-31" : [ "h6", "h6", 0 ],
			"obj-32" : [ "h5", "h5", 0 ],
			"obj-34" : [ "h4", "h4", 0 ],
			"obj-4" : [ "h11", "h11", 0 ],
			"obj-5" : [ "h10", "h10", 0 ],
			"obj-6" : [ "h9", "h9", 0 ],
			"obj-7" : [ "h8", "h8", 0 ],
			"obj-8" : [ "h15", "h15", 0 ],
			"obj-80" : [ "live.text[1]", "live.text[1]", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "link.svg",
				"bootpath" : "C74:/media/max/picts/m4l-picts",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "visual_feedback_linked_sliders.js",
				"bootpath" : "~/Documents/Max 8/Packages/qdts/patchers/js",
				"patcherrelativepath" : "../js",
				"type" : "TEXT",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
