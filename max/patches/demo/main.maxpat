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
		"rect" : [ -10.0, -993.0, 1147.0, 959.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
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
					"id" : "obj-23",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 89.808203339576721, 130.0, 73.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 780.0, 110.0, 69.0, 18.0 ],
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
					"presentation_rect" : [ 851.0, 111.0, 44.0, 15.0 ],
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
					"id" : "obj-11",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 593.150641798973083, 243.226009964942932, 37.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 604.0, 378.0, 43.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "Error",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"appearance" : 2,
					"id" : "obj-12",
					"ignoreclick" : 1,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 631.506803393363953, 244.59587287902832, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 649.0, 379.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "error",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "error",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "error"
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
					"patching_rect" : [ 339.0, 308.883710741996765, 833.0, 104.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 604.616413950920105, 265.054650545120239, 512.328729867935181, 105.47944438457489 ],
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
					"fontface" : 1,
					"id" : "obj-14",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 217.808203339576721, 43.835613250732422, 37.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 607.0, 110.0, 17.0, 18.0 ],
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
					"presentation_rect" : [ 627.0, 111.0, 44.0, 15.0 ],
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
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 339.0, 98.0, 833.0, 104.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 617.808174252510071, 149.315057635307312, 473.972568273544312, 105.47944438457489 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -303.0, 2.615381360054016, 228.923845052719116, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 243.825136780738831, 139.918033003807068, 307.883200779557228, 18.0 ],
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
					"id" : "obj-16",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -318.0, -12.384618639945984, 228.923845052719116, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 242.185792446136475, 265.054650545120239, 229.941184937953949, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "target amplitude distribution",
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
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 271.904090762138367, 421.917777538299561, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 504.480885982513428, 289.191263675689697, 48.0, 99.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ -24 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "live.gain~",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "live.gain~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 273.273953676223755, 571.232835173606873, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -86.921909630298615, 57.615381360054016, 51.538458466529846, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 487.54099452495575, 213.688528060913086, 51.538458466529846, 48.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_exponent" : 2.0,
							"parameter_initial" : [ 2000 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "freq_carrier",
							"parameter_mmax" : 5000.0,
							"parameter_mmin" : 500.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "freq_carrier",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "live.dial[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -86.921909630298615, 7.615381360054016, 51.538458466529846, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 487.54099452495575, 163.961749911308289, 51.538458466529846, 48.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_exponent" : 2.0,
							"parameter_initial" : [ 50 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "freq_target",
							"parameter_mmax" : 500.0,
							"parameter_mmin" : 20.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "freq_target",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "live.dial"
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
					"id" : "obj-170",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -31.007752418518066, 107.751939654350281, 51.16279149055481, 35.0 ],
					"text" : "29.352083"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-168",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -86.921909630298615, 111.063824325799942, 52.0, 22.0 ],
					"text" : "500."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"linecount" : 16,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -86.821706771850586, 197.260259628295898, 109.0, 223.0 ],
					"text" : "500. 528.26875 556.5375 584.80625 613.075 641.34375 676.1125 705.464583 734.816667 764.16875 793.520833 822.872917 852.225 881.577083 910.929167 940.28125 940.28125"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -86.821706771850586, 148.837211608886719, 83.0, 22.0 ],
					"text" : "carrierfreqgen"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 339.0, 214.825289964675903, 212.0, 22.0 ],
					"text" : "qdts.solver_nn @clamp 1 @variant 10"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"id" : "obj-131",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -318.0, 1.0, 348.0, 669.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 592.0, 104.0, 538.0, 297.0 ],
					"proportion" : 0.5,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_led_bg"
						}

					}

				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"midpoints" : [ 348.5, 270.0, 1162.5, 270.0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 1 ],
					"order" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"order" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 1 ],
					"order" : 0,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"order" : 1,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-127", 0 ]
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
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 1 ],
					"order" : 0,
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"order" : 1,
					"source" : [ "obj-170", 0 ]
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
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 172.308203339576721, 209.9765625, 336.0, 209.9765625, 336.0, 210.0, 348.5, 210.0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 265.66436493396759, 294.0, 348.5, 294.0 ],
					"order" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 265.66436493396759, 84.0, 348.5, 84.0 ],
					"order" : 0,
					"source" : [ "obj-3", 0 ]
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
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 1 ],
					"order" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"order" : 1,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 1 ],
					"order" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"order" : 1,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-10" : [ "live.gain~", "gain~", 0 ],
			"obj-12" : [ "error", "error", 0 ],
			"obj-18" : [ "Model Variant", "Model Variant", 0 ],
			"obj-3" : [ "N_Target_Tones", "N_tones", 0 ],
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
			"obj-8" : [ "freq_target", "freq_target", 0 ],
			"obj-9" : [ "freq_carrier", "freq_carrier", 0 ],
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
				"bootpath" : "~/Github/qdts/max/patches/demo",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "carrierfreqgen.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/demo",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "qdts.solver_nn.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "sinusoid.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/demo",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "synth.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/demo",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "target_amp_distribution_sliders_panel.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/demo",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
