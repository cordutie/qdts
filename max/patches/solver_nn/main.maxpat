{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 7,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 408.0, -993.0, 1364.0, 959.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -563.0, 579.147047996520996, 226.620000000000005, 22.0 ],
					"text" : "prepend freq_max"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ -355.379999999999995, 452.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ -563.0, 349.294110774993896, 227.0, 22.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -563.0, 550.0, 226.620000000000005, 22.0 ],
					"text" : "expr max($f1\\, 4000)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ -563.0, 520.0, 226.620000000000005, 22.0 ],
					"text" : "zl.nth 17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 745.588221073150635, 335.294111251831055, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 745.588221073150635, 311.764699935913086, 92.0, 22.0 ],
					"text" : "sprintf Error=%f"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-23",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 89.808203339576721, 130.0, 73.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 360.0, 404.5, 69.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "Model Variant",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"id" : "obj-18",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 163.808203339576721, 131.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 428.0, 405.5, 25.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Model Variant",
							"parameter_mmax" : 16.0,
							"parameter_mmin" : 1.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "Model Variant",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Model Variant"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-14",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 217.808203339576721, 43.835613250732422, 37.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 305.0, 405.0, 17.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "N",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"id" : "obj-3",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 256.16436493396759, 45.20547616481781, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 321.0, 406.0, 21.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "N_Target_Tones",
							"parameter_mmax" : 16.0,
							"parameter_mmin" : 5.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "N_tones",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "N_Target_Tones"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1287.0, 113.0, 314.0, 246.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 431.0, 9.0, 126.0, 36.0 ],
					"proportion" : 0.5,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_control_fg_zombie"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -387.0, 264.0, 129.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "qdts_carrier_freqs.js",
						"parameter_enable" : 0
					}
,
					"text" : "js qdts_carrier_freqs.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ -86.821706771850586, 28.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -280.0, 176.0, 90.0, 22.0 ],
					"text" : "prepend carrier"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -387.0, 176.0, 87.0, 22.0 ],
					"text" : "prepend target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -387.0, 176.0, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 75.0, 421.732835173606873, 126.0, 22.0 ],
					"text" : "prepend carrier_amps"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -57.0, 421.732835173606873, 123.0, 22.0 ],
					"text" : "prepend target_amps"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -180.0, 421.732835173606873, 117.0, 22.0 ],
					"text" : "prepend carrier_freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -307.0, 421.732835173606873, 114.0, 22.0 ],
					"text" : "prepend target_freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"linecount" : 7,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -563.0, 396.264698028564453, 195.0, 102.0 ],
					"text" : "2000 2284.566929 2569.133858 2853.7 3138.267717 3422.834646 3707.401575 3991.968504 4276.535433 4561.102362 4845.669291 5130.23622 5414.80315 5699.37 5983.937008 6268.503937 6553.070866"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-34",
					"linecount" : 3,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -171.821706771850586, 113.807690680027008, 82.389999999999986, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.5, 260.0, 156.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "Carrier Amplitude Distribution",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"id" : "obj-35",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -86.821706771850586, 116.807690680027008, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 241.0, 406.5, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 2000.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Target_Freq[1]",
							"parameter_mmax" : 5000.0,
							"parameter_mmin" : 500.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "Target_Freq",
							"parameter_type" : 0,
							"parameter_unitstyle" : 3
						}

					}
,
					"varname" : "Target_Freq[1]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-32",
					"linecount" : 4,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 13.0, 55.807690680027008, 58.0, 52.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 51.0, 65.0, 155.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}

					}
,
					"text" : "Target Amplitude Distribution",
					"textcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"id" : "obj-33",
					"lcdcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -51.0, 57.0, 62.0, 15.615381360054016 ],
					"presentation" : 1,
					"presentation_rect" : [ 128.0, 406.5, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 50.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Target_Freq",
							"parameter_mmax" : 500.0,
							"parameter_mmin" : 20.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "Target_Freq",
							"parameter_type" : 0,
							"parameter_unitstyle" : 3
						}

					}
,
					"varname" : "Target_Freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 163.808203339576721, 106.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 163.808203339576721, 148.0, 29.5, 22.0 ],
					"text" : "- 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 162.808203339576721, 176.0, 92.0, 22.0 ],
					"text" : "prepend variant"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-11",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 745.588221073150635, 360.294110774993896, 81.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 465.0, 404.0, 89.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "Error=0.000000",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-5",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "carrier_amp_distribution_panel.maxpat",
					"numinlets" : 2,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 339.705875873565674, 311.764699935913086, 383.823522090911865, 97.058821678161621 ],
					"presentation" : 1,
					"presentation_rect" : [ 57.5, 286.0, 499.0, 105.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 256.16436493396759, 12.328766226768494, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-6",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "target_amp_distribution_sliders_panel.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 339.705875873565674, 98.529409885406494, 383.823522090911865, 105.882350921630859 ],
					"presentation" : 1,
					"presentation_rect" : [ 53.0, 104.0, 511.0, 138.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 766.705867767333984, 216.825289964675903, 88.235292434692383, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 41.0, 11.0, 77.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "Neural QDTS",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"orientation" : 1,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 273.273953676223755, 505.882343292236328, 136.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 455.0, 729.0, 99.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ -24 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Gain",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "Gain",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "Gain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 273.273953676223755, 567.647047996520996, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 273.273953676223755, 393.150656342506409, 37.0, 22.0 ],
					"text" : "synth"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 339.705875873565674, 214.825289964675903, 424.999991893768311, 22.0 ],
					"text" : "qdts.solver_nn @clamp 1 @variant 10"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"carriercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"fontsize" : 10.0,
					"freq_max" : 4000.0,
					"id" : "obj-47",
					"log_scale" : 0,
					"maxclass" : "qdts.spectrum_view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -307.821706771850586, 625.0, 504.0, 244.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 39.0, 403.0, 534.0, 188.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}
,
						"carriercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"targetcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"targetcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1317.0, 143.0, 314.0, 246.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 39.0, 256.0, 534.0, 142.0 ],
					"proportion" : 0.5,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1302.0, 128.0, 314.0, 246.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 41.0, 61.0, 532.0, 189.0 ],
					"proportion" : 0.5,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"id" : "obj-131",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1272.0, 98.0, 314.0, 246.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 28.0, 4.0, 571.0, 609.0 ],
					"proportion" : 0.5,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_control_fg_zombie"
						}

					}

				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"midpoints" : [ 349.205875873565674, 284.965303538367152, 300.773953676223755, 284.965303538367152 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 755.205867767333984, 252.761719593778253, 755.088221073150635, 252.761719593778253 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 349.205875873565674, 267.846737688407302, 84.5, 267.846737688407302 ],
					"order" : 2,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"midpoints" : [ 349.205875873565674, 270.0, 714.029397964477539, 270.0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 1 ],
					"midpoints" : [ 282.773953676223755, 558.0, 308.773953676223755, 558.0 ],
					"order" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 282.773953676223755, 567.0, 282.773953676223755, 567.0 ],
					"order" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 172.308203339576721, 209.9765625, 336.0, 209.9765625, 336.0, 210.0, 349.205875873565674, 210.0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 265.66436493396759, 88.894324719905853, -553.5, 88.894324719905853 ],
					"order" : 2,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 265.66436493396759, 294.0, 349.205875873565674, 294.0 ],
					"order" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 265.66436493396759, 84.0, 349.205875873565674, 84.0 ],
					"order" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ -553.5, 609.6171875, -298.321706771850586, 609.6171875 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"midpoints" : [ -41.5, 247.174108266830444, -297.5, 247.174108266830444 ],
					"order" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"midpoints" : [ -41.5, 78.710034430027008, -377.5, 78.710034430027008 ],
					"order" : 1,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ -77.321706771850586, 132.0, 0.0, 132.0, 0.0, 350.929871548898518, -170.5, 350.929871548898518 ],
					"order" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ -77.321706771850586, 132.0, -270.5, 132.0 ],
					"order" : 1,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ -297.5, 444.0, -298.321706771850586, 444.0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ -170.5, 490.01198963355273, -298.158528844127432, 490.01198963355273, -298.158528844127432, 534.0, -298.321706771850586, 534.0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ -47.5, 491.633849799633026, -298.321706771850586, 491.633849799633026 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ 84.5, 491.633849799633026, -298.321706771850586, 491.633849799633026 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"midpoints" : [ -270.5, 201.0, -372.0, 201.0, -372.0, 261.0, -377.5, 261.0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"order" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 1,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ -377.5, 333.912062311545014, 282.773953676223755, 333.912062311545014 ],
					"order" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 1 ],
					"order" : 1,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"midpoints" : [ -377.5, 377.8828125, -553.5, 377.8828125 ],
					"order" : 2,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 349.205875873565674, 209.221737032756209, 264.0, 209.221737032756209, 264.0, 377.282340141944587, 0.0, 377.282340141944587, 0.0, 376.638446210883558, -47.5, 376.638446210883558 ],
					"order" : 1,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-10" : [ "Gain", "Gain", 0 ],
			"obj-18" : [ "Model Variant", "Model Variant", 0 ],
			"obj-3" : [ "N_Target_Tones", "N_tones", 0 ],
			"obj-33" : [ "Target_Freq", "Target_Freq", 0 ],
			"obj-35" : [ "Target_Freq[1]", "Target_Freq", 0 ],
			"obj-5::obj-1" : [ "h14[1]", "p17", 0 ],
			"obj-5::obj-2" : [ "h13[1]", "p16", 0 ],
			"obj-5::obj-3" : [ "h12[1]", "p15", 0 ],
			"obj-5::obj-35" : [ "p8", "p8", 0 ],
			"obj-5::obj-36" : [ "p7", "p7", 0 ],
			"obj-5::obj-37" : [ "p6", "p6", 0 ],
			"obj-5::obj-38" : [ "p5", "p5", 0 ],
			"obj-5::obj-39" : [ "p4", "p4", 0 ],
			"obj-5::obj-4" : [ "h11[1]", "p14", 0 ],
			"obj-5::obj-40" : [ "p3", "p3", 0 ],
			"obj-5::obj-41" : [ "p2", "p2", 0 ],
			"obj-5::obj-42" : [ "p1", "p1", 0 ],
			"obj-5::obj-43" : [ "p9", "p9", 0 ],
			"obj-5::obj-5" : [ "h10[1]", "p13", 0 ],
			"obj-5::obj-6" : [ "h9[1]", "p12", 0 ],
			"obj-5::obj-7" : [ "h8[1]", "p11", 0 ],
			"obj-5::obj-8" : [ "h15[1]", "p10", 0 ],
			"obj-6::obj-1" : [ "h14", "h14", 0 ],
			"obj-6::obj-15" : [ "f", "f", 0 ],
			"obj-6::obj-2" : [ "h13", "h13", 0 ],
			"obj-6::obj-20" : [ "h1", "h1", 0 ],
			"obj-6::obj-21" : [ "h3", "h3", 0 ],
			"obj-6::obj-22" : [ "h2", "h2", 0 ],
			"obj-6::obj-23" : [ "h7", "h7", 0 ],
			"obj-6::obj-3" : [ "h12", "h12", 0 ],
			"obj-6::obj-31" : [ "h6", "h6", 0 ],
			"obj-6::obj-32" : [ "h5", "h5", 0 ],
			"obj-6::obj-34" : [ "h4", "h4", 0 ],
			"obj-6::obj-4" : [ "h11", "h11", 0 ],
			"obj-6::obj-5" : [ "h10", "h10", 0 ],
			"obj-6::obj-6" : [ "h9", "h9", 0 ],
			"obj-6::obj-7" : [ "h8", "h8", 0 ],
			"obj-6::obj-8" : [ "h15", "h15", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-5::obj-1" : 				{
					"parameter_longname" : "h14[1]"
				}
,
				"obj-5::obj-2" : 				{
					"parameter_longname" : "h13[1]"
				}
,
				"obj-5::obj-3" : 				{
					"parameter_longname" : "h12[1]"
				}
,
				"obj-5::obj-4" : 				{
					"parameter_longname" : "h11[1]"
				}
,
				"obj-5::obj-5" : 				{
					"parameter_longname" : "h10[1]"
				}
,
				"obj-5::obj-6" : 				{
					"parameter_longname" : "h9[1]"
				}
,
				"obj-5::obj-7" : 				{
					"parameter_longname" : "h8[1]"
				}
,
				"obj-5::obj-8" : 				{
					"parameter_longname" : "h15[1]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "carrier_amp_distribution_panel.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "qdts.solver_nn.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "qdts.spectrum_view.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "qdts_carrier_freqs.js",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "sinusoid.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "synth.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "target_amp_distribution_sliders_panel.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
