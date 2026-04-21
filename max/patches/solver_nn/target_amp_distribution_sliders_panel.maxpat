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
		"rect" : [ 34.0, 106.0, 1027.0, 1029.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 769.0, 415.0, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 837.0, 505.0, 86.0, 22.0 ],
					"text" : "r ---target_freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 795.0, 547.0, 29.5, 22.0 ],
					"text" : "* 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-91",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 706.0, 453.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 728.0, 603.0, 200.0, 22.0 ],
					"text" : "sprintf script send h1_hz set %.0fHz"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 527.0, 496.0, 29.5, 22.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 706.0, 501.0, 41.0, 22.0 ],
					"text" : "uzi 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 527.0, 459.523816645145416, 86.0, 22.0 ],
					"text" : "r ---target_freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 665.0, 304.0, 65.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 121.0, 39.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "472Hz",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1,
					"varname" : "h1_hz"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 593.0, 187.0, 88.0, 22.0 ],
					"text" : "s ---target_freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 527.0, 603.0, 190.0, 22.0 ],
					"text" : "sprintf script send f_hz set %.0fHz"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 592.0, 304.0, 65.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.5, 101.0, 48.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "546Hz",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 1,
					"varname" : "f_hz"
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
					"patching_rect" : [ 592.909999999999968, 145.050000000000011, 30.0, 30.0 ]
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
					"patching_rect" : [ 5.0, 125.365081369876862, 30.0, 30.0 ]
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
					"patching_rect" : [ 339.682544946670532, 576.984135925769806, 104.761906385421753, 20.0 ],
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
					"patching_rect" : [ 297.619052231311798, 521.42857950925827, 29.5, 22.0 ],
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
					"patching_rect" : [ 276.619052231311798, 459.523816645145416, 50.5, 22.0 ],
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
					"patching_rect" : [ 319.047623991966248, 603.174612522125244, 132.0, 22.0 ],
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
					"patching_rect" : [ 297.619052231311798, 546.825405299663544, 40.0, 22.0 ],
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
					"patching_rect" : [ 297.619052231311798, 576.190485119819641, 40.0, 22.0 ],
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
					"patching_rect" : [ 181.746034562587738, 643.650803625583649, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-8",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 499.206356942653656, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 449.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h15"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-1",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 469.841277122497559, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 420.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h14"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-2",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 440.476197302341461, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 390.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h13"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-3",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 411.904768288135529, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 361.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h12"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-4",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 382.539688467979431, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 332.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h11"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-5",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 353.968259453773499, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 303.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h10"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-6",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 324.603179633617401, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 274.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h9"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-7",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 296.031750619411469, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 245.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h8"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-23",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 266.666670799255371, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 216.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h7"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-31",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 238.095241785049438, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h6"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-32",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 208.730161964893341, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 157.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 180.158732950687408, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 128.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 150.793653130531311, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 99.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 122.222224116325378, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 92.857144296169281, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 41.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
					"varname" : "h1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 63.492064476013184, 241.269845008850098, 27.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.0, 1.0, 27.0, 98.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_dial_needle_zombie"
						}
,
						"valueof" : 						{
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
					"shownumber" : 0,
					"slidercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.411764705882353, 0.411764705882353, 0.411764705882353, 1.0 ],
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
					"destination" : [ "obj-75", 0 ],
					"midpoints" : [ 14.5, 396.401480257511139, 286.119052231311798, 396.401480257511139 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-15", 0 ]
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
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-24", 0 ]
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
					"destination" : [ "obj-28", 4 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"order" : 1,
					"source" : [ "obj-36", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"order" : 0,
					"source" : [ "obj-36", 2 ]
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
					"destination" : [ "obj-28", 11 ],
					"source" : [ "obj-4", 0 ]
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
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 191.246034562587738, 626.857141971588135, 191.246034562587738, 626.857141971588135 ],
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
					"midpoints" : [ 328.547623991966248, 638.857141971588135, 191.246034562587738, 638.857141971588135 ],
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
					"midpoints" : [ 286.119052231311798, 492.271949223009869, 45.478670409880579, 492.271949223009869, 45.478670409880579, 345.0, 72.992064476013184, 345.0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 1 ],
					"midpoints" : [ 296.619052231311798, 507.0, 98.992064476013184, 507.0 ],
					"source" : [ "obj-75", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 317.619052231311798, 513.886283992091194, 169.023811995983124, 513.886283992091194 ],
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
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-86", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-86", 0 ]
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
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-91", 0 ]
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
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 1 ],
					"source" : [ "obj-97", 0 ]
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
