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
		"rect" : [ 34.0, 106.0, 1334.0, 1029.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-17",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 334.0, -8.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 17,
					"outlettype" : [ "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float", "float" ],
					"patching_rect" : [ 334.0, 40.0, 483.0, 22.0 ],
					"text" : "unpack 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 19.0, 71.0, 29.5, 22.0 ],
					"text" : "t f b"
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
					"patching_rect" : [ 19.0, -8.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 211.0, 205.0, 104.761906385421753, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1019.0, 394.0, 104.761906385421753, 20.0 ],
					"text" : "Show 1 to N-1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.0, 205.0, 82.539683818817139, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 884.0, 394.0, 82.539683818817139, 20.0 ],
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
					"patching_rect" : [ 169.0, 150.0, 29.5, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 977.0, 339.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 232.0, 132.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 999.0, 420.0, 132.0, 22.0 ],
					"text" : "sprintf script show p%d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 169.0, 175.0, 40.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 977.0, 364.0, 40.0, 22.0 ],
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
					"patching_rect" : [ 169.0, 205.0, 40.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 977.0, 393.0, 40.0, 22.0 ],
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
					"patching_rect" : [ 53.0, 232.0, 127.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 862.0, 420.0, 127.0, 22.0 ],
					"text" : "sprintf script hide p%d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 30.0, 205.0, 41.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 839.0, 393.0, 41.0, 22.0 ],
					"text" : "uzi 17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 53.0, 272.0, 67.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 862.0, 461.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 798.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 464.0, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p17",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p17",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 769.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 435.0625, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p16",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p16",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 740.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 406.125, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p15",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p15",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p15"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 711.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 377.1875, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p14",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p14",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p14"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 682.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 348.25, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p13",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p13",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p13"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 653.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.3125, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p12",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p12",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 624.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 290.375, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p11",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p11",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p11"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 595.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 261.4375, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p10",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p10",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 566.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.5, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p9",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p9",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p9"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 537.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 203.5625, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p8",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p8",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 508.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 174.625, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p7",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p7",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 479.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.6875, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p6",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p6",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 450.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 116.75, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p5",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p5",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 421.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 87.8125, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p4",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p4",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 392.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 58.875, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p3",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p3",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 363.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 29.9375, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p2",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p2",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"ignoreclick" : 1,
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 334.0, 90.0, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 2.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "p1",
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "p1",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "p1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 28.5, 114.0625, 178.5, 114.0625 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-12", 16 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-12", 15 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-12", 14 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-12", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-12", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-12", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-12", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-12", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-12", 13 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-12", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-12", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-12", 12 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-12", 11 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-12", 10 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-12", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-17", 0 ]
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
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 62.5, 255.206338346004486, 62.5, 255.206338346004486 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 199.5, 267.206338346004486, 62.5, 267.206338346004486 ],
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
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1" : [ "p17", "p17", 0 ],
			"obj-2" : [ "p16", "p16", 0 ],
			"obj-3" : [ "p15", "p15", 0 ],
			"obj-35" : [ "p8", "p8", 0 ],
			"obj-36" : [ "p7", "p7", 0 ],
			"obj-37" : [ "p6", "p6", 0 ],
			"obj-38" : [ "p5", "p5", 0 ],
			"obj-39" : [ "p4", "p4", 0 ],
			"obj-4" : [ "p14", "p14", 0 ],
			"obj-40" : [ "p3", "p3", 0 ],
			"obj-41" : [ "p2", "p2", 0 ],
			"obj-42" : [ "p1", "p1", 0 ],
			"obj-43" : [ "p9", "p9", 0 ],
			"obj-5" : [ "p13", "p13", 0 ],
			"obj-6" : [ "p12", "p12", 0 ],
			"obj-7" : [ "p11", "p11", 0 ],
			"obj-8" : [ "p10", "p10", 0 ],
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
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
