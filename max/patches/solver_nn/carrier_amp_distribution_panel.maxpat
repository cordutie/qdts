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
		"rect" : [ 408.0, -993.0, 1147.0, 959.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 287.0, 164.0, 22.0 ],
					"text" : "sprintf script show p%d_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 53.0, 287.0, 159.0, 22.0 ],
					"text" : "sprintf script hide p%d_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 663.0, 300.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 686.0, 342.0, 207.0, 22.0 ],
					"text" : "0. 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 627.0, 329.0, 55.0, 22.0 ],
					"text" : "zl.slice 5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 17,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 627.0, 256.0, 481.619718134403229, 22.0 ],
					"text" : "pak 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-12",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 627.0, 371.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 86.428573489189148, -65.714287281036377, 29.5, 22.0 ],
					"text" : "17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.619718134403229, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 464.880281865596771, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p17 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p17_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1061.619718134403229, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 435.880281865596771, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p16 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p16_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1032.362636744976044, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 407.0, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p15 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p15_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1004.862636744976044, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 377.880281865596771, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p14 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p14_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 975.362636744976044, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 348.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p13",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p13_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 945.362636744976044, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.880281865596771, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p12 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p12_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 917.362636744976044, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 290.880281865596771, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p11 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p11_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 886.637363255023956, 213.186823606491089, 27.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 261.880281865596771, 0.0, 27.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p10 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p10_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 859.362636744976044, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 233.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p9",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p9_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 825.549453020095825, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 203.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p8 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p8_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 798.274726510047913, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 175.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p7",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p7_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 771.0, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 147.725273489952087, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p6",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p6_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 741.637363255023956, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 118.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p5",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p5_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 714.362636744976044, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p4 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p4_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 684.362636744976044, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p3",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p3_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.362636744976044, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p2",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p2_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 627.362636744976044, 213.186823606491089, 25.274726510047913, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.742918610572815, 0.0, 25.274726510047913, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "p1 ",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "p1_label"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 261.0, 139.0, 22.0 ],
					"text" : "sprintf script show ph%d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 261.0, 133.0, 22.0 ],
					"text" : "sprintf script hide ph%d"
				}

			}
, 			{
				"box" : 				{
					"code" : "var amps = [];\n\nfunction list() {\n    amps = arrayfromargs(arguments);\n    for (var i = 0; i < amps.length; i++) {\n        var pObj = this.patcher.getnamed(\"p\" + (i + 1));\n        if (pObj) pObj.set(amps[i]);\n    }\n}",
					"filename" : "none",
					"fontface" : 0,
					"fontname" : "<Monospaced>",
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "v8.codebox",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 627.0, -120.0, 548.0, 177.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-68",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1089.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 465.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph17",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph17",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph17"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-67",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1061.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 436.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph16",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph16",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph16"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-58",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1031.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 407.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph15",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph15",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph15"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-61",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1002.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 378.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph14",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph14",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph14"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-62",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 916.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 291.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph11",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph11",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph11"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-65",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 828.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 203.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph8",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph8",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph8"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-66",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 741.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 118.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph5",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph5",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph5"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-57",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 974.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 348.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph13",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph13",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph13"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-69",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 944.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 320.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph12",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph12",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph12"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-70",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 858.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 233.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph9",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph9",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph9"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-71",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 771.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 146.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph6",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph6",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph6"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-72",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 683.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph3",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph3",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph3"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-73",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 886.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 262.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph10",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph10",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph10"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-46",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 799.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 175.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph7",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph7",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph7"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-76",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 713.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph4",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph4",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph4"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-22",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 654.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_linknames" : 1,
							"parameter_longname" : "ph2",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph2",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph2"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
					"annotation_name" : "Oscillator Phase",
					"appearance" : 2,
					"id" : "obj-82",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 626.619718134403229, 191.0, 26.760563731193542, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 18.0, 26.760563731193542, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Oscillator Phase",
							"parameter_info" : "Phase offset for each oscillator at sync point (0–1, where 0 = 0° and 1 = 360°). Also determines the initial phase when the synth starts.",
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "ph1",
							"parameter_mmax" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "ph1",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"textjustification" : 0,
					"varname" : "ph1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 334.0, 175.0, 233.0, 22.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 379.0, 205.0, 145.0, 20.0 ],
					"text" : "enable/disable interaction"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 356.0, 232.0, 211.0, 22.0 ],
					"text" : "sprintf script send p%d ignoreclick %d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 334.0, 205.0, 41.0, 22.0 ],
					"text" : "uzi 17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 19.0, -256.0, 127.0, 22.0 ],
					"text" : "route N ignoreclick set"
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
					"patching_rect" : [ 19.0, -304.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 211.0, 205.0, 104.761906385421753, 20.0 ],
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
					"patching_rect" : [ 53.0, 347.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1090.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p16",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1061.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p15",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1032.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p14",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p15"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1003.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p13",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p14"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 974.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p12",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p13"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 945.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p11",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 916.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p10",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p11"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 887.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p9",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 858.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p8",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p9"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 829.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p7",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 800.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p6",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 771.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p5",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 742.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p4",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 713.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p3",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 684.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p2",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 655.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "p1",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "p2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "live.slider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 626.0, 104.0, 29.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"tricolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"trioncolor" : 						{
							"expression" : "themecolor.live_value_arc"
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
							"parameter_shortname" : "Car.",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"slidercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tribordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"tricolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
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
					"destination" : [ "obj-10", 0 ],
					"order" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 64.5, 77.46484375, 343.5, 77.46484375 ],
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"midpoints" : [ 28.5, -114.125, 612.0, -114.125, 612.0, 297.0, 672.5, 297.0 ],
					"order" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 100.5, -168.53125, 635.82421875, -168.53125, 635.82421875, -120.0, 636.5, -120.0 ],
					"source" : [ "obj-11", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 1,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 1 ],
					"order" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 365.5, 333.0, 62.5, 333.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-19", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"source" : [ "obj-21", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 61.5, 333.0, 62.5, 333.0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 199.5, 333.0, 62.5, 333.0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 6 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"order" : 2,
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"order" : 1,
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"order" : 0,
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 12 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 14 ],
					"source" : [ "obj-58", 0 ]
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
					"midpoints" : [ 199.5, 319.792275846004486, 62.5, 319.792275846004486 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 13 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 10 ],
					"source" : [ "obj-62", 0 ]
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
					"destination" : [ "obj-31", 0 ],
					"order" : 1,
					"source" : [ "obj-64", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"order" : 2,
					"source" : [ "obj-64", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"order" : 0,
					"source" : [ "obj-64", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 7 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 4 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 15 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 16 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 11 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 8 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 5 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 9 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 3 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
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
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 199.5, 333.0, 62.5, 333.0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1" : [ "p17", "p16", 0 ],
			"obj-2" : [ "p16", "p15", 0 ],
			"obj-22" : [ "ph2", "ph2", 0 ],
			"obj-3" : [ "p15", "p14", 0 ],
			"obj-35" : [ "p8", "p7", 0 ],
			"obj-36" : [ "p7", "p6", 0 ],
			"obj-37" : [ "p6", "p5", 0 ],
			"obj-38" : [ "p5", "p4", 0 ],
			"obj-39" : [ "p4", "p3", 0 ],
			"obj-4" : [ "p14", "p13", 0 ],
			"obj-40" : [ "p3", "p2", 0 ],
			"obj-41" : [ "p2", "p1", 0 ],
			"obj-42" : [ "p1", "Car.", 0 ],
			"obj-43" : [ "p9", "p8", 0 ],
			"obj-46" : [ "ph7", "ph7", 0 ],
			"obj-5" : [ "p13", "p12", 0 ],
			"obj-57" : [ "ph13", "ph13", 0 ],
			"obj-58" : [ "ph15", "ph15", 0 ],
			"obj-6" : [ "p12", "p11", 0 ],
			"obj-61" : [ "ph14", "ph14", 0 ],
			"obj-62" : [ "ph11", "ph11", 0 ],
			"obj-65" : [ "ph8", "ph8", 0 ],
			"obj-66" : [ "ph5", "ph5", 0 ],
			"obj-67" : [ "ph16", "ph16", 0 ],
			"obj-68" : [ "ph17", "ph17", 0 ],
			"obj-69" : [ "ph12", "ph12", 0 ],
			"obj-7" : [ "p11", "p10", 0 ],
			"obj-70" : [ "ph9", "ph9", 0 ],
			"obj-71" : [ "ph6", "ph6", 0 ],
			"obj-72" : [ "ph3", "ph3", 0 ],
			"obj-73" : [ "ph10", "ph10", 0 ],
			"obj-76" : [ "ph4", "ph4", 0 ],
			"obj-8" : [ "p10", "p9", 0 ],
			"obj-82" : [ "ph1", "ph1", 0 ],
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
