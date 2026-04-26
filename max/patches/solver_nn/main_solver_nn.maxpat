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
		"rect" : [ 34.0, 106.0, 1374.0, 1029.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 273.134318590164185, 632.0, 134.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "synth_input_parser.js",
						"parameter_enable" : 0
					}
,
					"text" : "js synth_input_parser.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -387.0, 260.0, 129.0, 22.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"linecount" : 17,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1150.0, 120.454544305801392, 191.0, 234.0 ],
					"presentation" : 1,
					"presentation_linecount" : 9,
					"presentation_rect" : [ 564.0, 263.0, 358.0, 127.0 ],
					"text" : "Neural QDTS uses a trained neural network to solve this inverse problem — mapping a target amplitude profile to the optimal high-frequency carrier parameters.\n\nIn this patch, high-frequency carrier tones (blue) are emitted acoustically; the ear's nonlinearity generates perceived low-frequency target tones (orange) as difference tones. Set your desired target amplitude profile, choose a model variant, and the neural network computes the optimal carrier configuration.",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"id" : "obj-61",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1150.0, 76.454544305801392, 189.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 564.0, 239.0, 355.0, 22.0 ],
					"text" : "Neural QDTS",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"linecount" : 22,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 958.0, 120.454544305801392, 191.0, 301.0 ],
					"presentation" : 1,
					"presentation_linecount" : 12,
					"presentation_rect" : [ 564.0, 67.0, 355.0, 167.0 ],
					"text" : "When two tones at frequencies f₁ and f₂ are played simultaneously, the ear's cochlea — due to its mechanical nonlinearity — generates additional phantom tones at combination frequencies, most prominently at f₂ − f₁. This perceptual effect, known as a combination tone or Tartini tone, allows very low frequencies to be perceived even when no low-frequency sound is physically present.\n\nThere is established literature on predicting which difference tones are perceived given a set of carriers. Here, we invert the problem: given a desired low-frequency perceptual target, what carrier configuration should be emitted to produce it? ",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"id" : "obj-38",
					"linecount" : 2,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 958.0, 76.454544305801392, 188.0, 38.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 564.0, 43.0, 355.0, 22.0 ],
					"text" : "About QDTS (Quadratic Difference Tone Spectrum)",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"annotation" : "When enabled, the target amplitudes will be linked to the fundamental amplitude (f)",
					"annotation_name" : "Link target amplitudes",
					"id" : "obj-80",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 339.705875873565674, 13.14124321937561, 44.0, 15.0 ],
					"pictures" : [ "link.svg", "link.svg" ],
					"presentation" : 1,
					"presentation_rect" : [ 308.140347957611084, 174.903369531035423, 17.336683809757233, 16.193260937929153 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Link target amplitudes",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_info" : "When enabled, the target amplitudes will be linked to the fundamental amplitude (f)",
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Link",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "Link",
							"parameter_type" : 2
						}

					}
,
					"usepicture" : 1,
					"varname" : "Link"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -10.416666269302368, -203.521129429340363, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ -51.0, -203.521129429340363, 29.5, 22.0 ],
					"text" : "!- 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -51.0, -176.056340336799622, 92.0, 22.0 ],
					"text" : "prepend hidden"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "When enabled, you can use a piano key interface to control the target pitch",
					"annotation_name" : "Show Keyboard",
					"id" : "obj-63",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -51.0, -224.647890269756317, 44.0, 15.0 ],
					"pictures" : [ "piano_keys.svg", "piano_keys.svg" ],
					"presentation" : 1,
					"presentation_rect" : [ 147.183100521564484, 42.5076884329319, 16.901408672332764, 16.147885024547577 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Show Keyboard",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_info" : "When enabled, you can use a piano key interface to control the target pitch",
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "show_piano",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "show_piano",
							"parameter_type" : 2
						}

					}
,
					"usepicture" : 1,
					"varname" : "show_piano"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"annotation" : "\"Resets all oscillator phases to their defined phase offsets simultaneously\" ",
					"annotation_name" : "Sync",
					"id" : "obj-74",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 311.770681858062744, 677.272720813751221, 48.749995350837708, 21.249997973442078 ],
					"presentation" : 1,
					"presentation_rect" : [ 270.175436019897461, 284.21052360534668, 40.500014066696167, 13.749998688697815 ],
					"saved_attribute_attributes" : 					{
						"activebgoncolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Sync",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_info" : "\"Resets all oscillator phases to their defined phase offsets simultaneously\" ",
							"parameter_longname" : "resync",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "resync",
							"parameter_type" : 2
						}

					}
,
					"text" : "Sync",
					"varname" : "resync"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 311.770681858062744, 804.545446872711182, 117.709184527397156, 22.0 ],
					"text" : "prepend sync"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 7,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 1260.0, -907.0, 1000.0, 780.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 98.0, 82.0, 150.0, 74.0 ],
									"text" : "Pads with extra zeros and slices at 17 to ensure the amplitude of extra tones not used is set to zero\n"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 16.0, 122.0, 64.0, 22.0 ],
									"text" : "zl.slice 17"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 61.0, 49.0, 205.0, 22.0 ],
									"text" : "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 61.0, 19.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 16.0, 82.0, 64.0, 22.0 ],
									"text" : "zl.join"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 16.0, 157.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 16.0, 11.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 1 ],
									"source" : [ "obj-20", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 385.820881724357605, 452.499956846237183, 39.0, 22.0 ],
					"text" : "p pad"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 385.820881724357605, 520.0, 95.0, 22.0 ],
					"text" : "prepend phases"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-2",
					"linecount" : 2,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 396.59090530872345, 351.136360287666321, 146.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.438596248626709, 282.0, 249.122804641723633, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"text" : "Carrier Phase Distribution (Acoustically Emitted Tones)",
					"textcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-32",
					"linecount" : 3,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 13.0, 55.807690680027008, 146.0, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.438596248626709, 174.0, 281.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}

					}
,
					"text" : "Target Amplitude Distribution (Perceived Psychoacoustic Tones)",
					"textcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -51.0, -76.0, 32.0, 22.0 ],
					"text" : "mtof"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-36",
					"maxclass" : "kslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 16,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ -51.0, -146.0, 396.0, 53.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 564.084514439105988, 6.185185357928276, 231.0, 34.0 ],
					"range" : 56,
					"varname" : "piano_keys"
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
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 385.820881724357605, 371.641777753829956, 497.761176228523254, 32.835819721221924 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.221240967512131, 300.884979963302612, 496.017739027738571, 30.088497996330261 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.090901374816895, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 278.0, 533.0, 65.0 ],
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
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 385.820881724357605, 285.820885300636292, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 278.273953676223755, 64.406781196594238, 65.0, 22.0 ],
					"text" : "prepend N"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 339.705875873565674, 38.0, 74.0, 22.0 ],
					"text" : "prepend link"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 311.770681858062744, 763.636356353759766, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 311.770681858062744, 736.363629341125488, 61.0, 22.0 ],
					"text" : "delay 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 377.679772138595581, 763.636356353759766, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 311.770681858062744, 707.954538702964783, 84.332133173942566, 22.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 7,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "dsp.gen",
						"rect" : [ 59.0, 125.0, 1274.0, 925.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 122,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 994.620000000000005, 197.27000000000001, 150.0, 1642.0 ],
									"text" : "Param f0(440); Param f1(440); Param f2(440); Param f3(440); Param f4(440);\nParam f5(440); Param f6(440); Param f7(440); Param f8(440); Param f9(440);\nParam f10(440); Param f11(440); Param f12(440); Param f13(440); Param f14(440);\nParam f15(440); Param f16(440);\n\nParam a0(0); Param a1(0); Param a2(0); Param a3(0); Param a4(0);\nParam a5(0); Param a6(0); Param a7(0); Param a8(0); Param a9(0);\nParam a10(0); Param a11(0); Param a12(0); Param a13(0); Param a14(0);\nParam a15(0); Param a16(0);\n\n\nHistory ph0(0); History ph1(0); History ph2(0); History ph3(0);\nHistory ph4(0); History ph5(0); History ph6(0); History ph7(0);\nHistory ph8(0); History ph9(0); History ph10(0); History ph11(0);\nHistory ph12(0); History ph13(0); History ph14(0); History ph15(0);\nHistory ph16(0);\nHistory prev_resync(0);\n\nresync_now  = in1 > 0.5;\nresync_edge = resync_now && !prev_resync;\nprev_resync = resync_now;\n\nph0  = resync_edge ? 0  : wrap(ph0  + f0  / samplerate, 0, 1);\nph1  = resync_edge ? 0  : wrap(ph1  + f1  / samplerate, 0, 1);\nph2  = resync_edge ? 0  : wrap(ph2  + f2  / samplerate, 0, 1);\nph3  = resync_edge ? 0  : wrap(ph3  + f3  / samplerate, 0, 1);\nph4  = resync_edge ? 0  : wrap(ph4  + f4  / samplerate, 0, 1);\nph5  = resync_edge ? 0  : wrap(ph5  + f5  / samplerate, 0, 1);\nph6  = resync_edge ? 0  : wrap(ph6  + f6  / samplerate, 0, 1);\nph7  = resync_edge ? 0  : wrap(ph7  + f7  / samplerate, 0, 1);\nph8  = resync_edge ? 0  : wrap(ph8  + f8  / samplerate, 0, 1);\nph9  = resync_edge ? 0  : wrap(ph9  + f9  / samplerate, 0, 1);\nph10 = resync_edge ? 0 : wrap(ph10 + f10 / samplerate, 0, 1);\nph11 = resync_edge ? 0 : wrap(ph11 + f11 / samplerate, 0, 1);\nph12 = resync_edge ? 0 : wrap(ph12 + f12 / samplerate, 0, 1);\nph13 = resync_edge ? 0 : wrap(ph13 + f13 / samplerate, 0, 1);\nph14 = resync_edge ? 0 : wrap(ph14 + f14 / samplerate, 0, 1);\nph15 = resync_edge ? 0 : wrap(ph15 + f15 / samplerate, 0, 1);\nph16 = resync_edge ? 0 : wrap(ph16 + f16 / samplerate, 0, 1);\n\nout1 = a0*sin(ph0*twopi)   + a1*sin(ph1*twopi)   + a2*sin(ph2*twopi)\n     + a3*sin(ph3*twopi)   + a4*sin(ph4*twopi)   + a5*sin(ph5*twopi)\n     + a6*sin(ph6*twopi)   + a7*sin(ph7*twopi)   + a8*sin(ph8*twopi)\n     + a9*sin(ph9*twopi)   + a10*sin(ph10*twopi) + a11*sin(ph11*twopi)\n     + a12*sin(ph12*twopi) + a13*sin(ph13*twopi) + a14*sin(ph14*twopi)\n     + a15*sin(ph15*twopi) + a16*sin(ph16*twopi);"
								}

							}
, 							{
								"box" : 								{
									"code" : "// 17-tone Additive Synthesizer with phase sync and parameter smoothing\n// Params: f0-f16 (frequencies), a0-a16 (amplitudes), p0-p16 (phases)\n// sync: send a pulse to reset all phase accumulators\n\nParam f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16;\nParam a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16;\nParam p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16;\nParam sync;\n\nHistory phase0, phase1, phase2, phase3, phase4, phase5, phase6, phase7;\nHistory phase8, phase9, phase10, phase11, phase12, phase13, phase14, phase15, phase16;\nHistory sync_prev;\n\nHistory sa0, sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8;\nHistory sa9, sa10, sa11, sa12, sa13, sa14, sa15, sa16;\nHistory sp0, sp1, sp2, sp3, sp4, sp5, sp6, sp7, sp8;\nHistory sp9, sp10, sp11, sp12, sp13, sp14, sp15, sp16;\n\n// Smoothing coefficient — tweak to taste (0.001 = ~few ms at 44100Hz)\nsmooth_coef = 0.001;\n\n// Sync detection (rising edge)\ndo_sync = (sync > 0) && (sync_prev <= 0);\nsync_prev = sync;\nif (do_sync) print(do_sync);\n\n// Smooth amplitudes\nsa0  = sa0  + smooth_coef * (a0  - sa0);\nsa1  = sa1  + smooth_coef * (a1  - sa1);\nsa2  = sa2  + smooth_coef * (a2  - sa2);\nsa3  = sa3  + smooth_coef * (a3  - sa3);\nsa4  = sa4  + smooth_coef * (a4  - sa4);\nsa5  = sa5  + smooth_coef * (a5  - sa5);\nsa6  = sa6  + smooth_coef * (a6  - sa6);\nsa7  = sa7  + smooth_coef * (a7  - sa7);\nsa8  = sa8  + smooth_coef * (a8  - sa8);\nsa9  = sa9  + smooth_coef * (a9  - sa9);\nsa10 = sa10 + smooth_coef * (a10 - sa10);\nsa11 = sa11 + smooth_coef * (a11 - sa11);\nsa12 = sa12 + smooth_coef * (a12 - sa12);\nsa13 = sa13 + smooth_coef * (a13 - sa13);\nsa14 = sa14 + smooth_coef * (a14 - sa14);\nsa15 = sa15 + smooth_coef * (a15 - sa15);\nsa16 = sa16 + smooth_coef * (a16 - sa16);\n\n// Smooth phases\nsp0  = sp0  + smooth_coef * (p0  - sp0);\nsp1  = sp1  + smooth_coef * (p1  - sp1);\nsp2  = sp2  + smooth_coef * (p2  - sp2);\nsp3  = sp3  + smooth_coef * (p3  - sp3);\nsp4  = sp4  + smooth_coef * (p4  - sp4);\nsp5  = sp5  + smooth_coef * (p5  - sp5);\nsp6  = sp6  + smooth_coef * (p6  - sp6);\nsp7  = sp7  + smooth_coef * (p7  - sp7);\nsp8  = sp8  + smooth_coef * (p8  - sp8);\nsp9  = sp9  + smooth_coef * (p9  - sp9);\nsp10 = sp10 + smooth_coef * (p10 - sp10);\nsp11 = sp11 + smooth_coef * (p11 - sp11);\nsp12 = sp12 + smooth_coef * (p12 - sp12);\nsp13 = sp13 + smooth_coef * (p13 - sp13);\nsp14 = sp14 + smooth_coef * (p14 - sp14);\nsp15 = sp15 + smooth_coef * (p15 - sp15);\nsp16 = sp16 + smooth_coef * (p16 - sp16);\n\n// Update phase accumulators (reset to 0 on sync)\nphase0  = do_sync ? 0 : wrap(phase0  + f0  / samplerate, 0, 1);\nphase1  = do_sync ? 0 : wrap(phase1  + f1  / samplerate, 0, 1);\nphase2  = do_sync ? 0 : wrap(phase2  + f2  / samplerate, 0, 1);\nphase3  = do_sync ? 0 : wrap(phase3  + f3  / samplerate, 0, 1);\nphase4  = do_sync ? 0 : wrap(phase4  + f4  / samplerate, 0, 1);\nphase5  = do_sync ? 0 : wrap(phase5  + f5  / samplerate, 0, 1);\nphase6  = do_sync ? 0 : wrap(phase6  + f6  / samplerate, 0, 1);\nphase7  = do_sync ? 0 : wrap(phase7  + f7  / samplerate, 0, 1);\nphase8  = do_sync ? 0 : wrap(phase8  + f8  / samplerate, 0, 1);\nphase9  = do_sync ? 0 : wrap(phase9  + f9  / samplerate, 0, 1);\nphase10 = do_sync ? 0 : wrap(phase10 + f10 / samplerate, 0, 1);\nphase11 = do_sync ? 0 : wrap(phase11 + f11 / samplerate, 0, 1);\nphase12 = do_sync ? 0 : wrap(phase12 + f12 / samplerate, 0, 1);\nphase13 = do_sync ? 0 : wrap(phase13 + f13 / samplerate, 0, 1);\nphase14 = do_sync ? 0 : wrap(phase14 + f14 / samplerate, 0, 1);\nphase15 = do_sync ? 0 : wrap(phase15 + f15 / samplerate, 0, 1);\nphase16 = do_sync ? 0 : wrap(phase16 + f16 / samplerate, 0, 1);\n\n// Sum all tones using smoothed parameters\nout1 =\n  sa0  * sin(twopi * (phase0  + sp0))  +\n  sa1  * sin(twopi * (phase1  + sp1))  +\n  sa2  * sin(twopi * (phase2  + sp2))  +\n  sa3  * sin(twopi * (phase3  + sp3))  +\n  sa4  * sin(twopi * (phase4  + sp4))  +\n  sa5  * sin(twopi * (phase5  + sp5))  +\n  sa6  * sin(twopi * (phase6  + sp6))  +\n  sa7  * sin(twopi * (phase7  + sp7))  +\n  sa8  * sin(twopi * (phase8  + sp8))  +\n  sa9  * sin(twopi * (phase9  + sp9))  +\n  sa10 * sin(twopi * (phase10 + sp10)) +\n  sa11 * sin(twopi * (phase11 + sp11)) +\n  sa12 * sin(twopi * (phase12 + sp12)) +\n  sa13 * sin(twopi * (phase13 + sp13)) +\n  sa14 * sin(twopi * (phase14 + sp14)) +\n  sa15 * sin(twopi * (phase15 + sp15)) +\n  sa16 * sin(twopi * (phase16 + sp16));",
									"fontface" : 0,
									"fontname" : "<Monospaced>",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 71.0, 76.0, 778.0, 769.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 71.0, 24.0, 28.0, 22.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 71.0, 863.0, 35.0, 22.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 273.134318590164185, 845.454537391662598, 57.0, 22.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 202.0, 520.0, 83.0, 22.0 ],
					"text" : "prepend freqs"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 291.273953676223755, 520.0, 85.0, 22.0 ],
					"text" : "prepend amps"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 7,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 1260.0, -907.0, 1000.0, 780.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 98.0, 82.0, 150.0, 74.0 ],
									"text" : "Pads with extra zeros and slices at 17 to ensure the amplitude of extra tones not used is set to zero\n"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 16.0, 122.0, 64.0, 22.0 ],
									"text" : "zl.slice 17"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 61.0, 49.0, 205.0, 22.0 ],
									"text" : "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 61.0, 19.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 16.0, 82.0, 64.0, 22.0 ],
									"text" : "zl.join"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 16.0, 157.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 16.0, 11.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 1 ],
									"source" : [ "obj-20", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 291.273953676223755, 331.0, 39.0, 22.0 ],
					"text" : "p pad"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"id" : "obj-16",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 418.588862657546997, 971.59089982509613, 82.0, 65.249974012374878 ],
					"presentation" : 1,
					"presentation_rect" : [ 411.267611026763916, 348.591553866863251, 109.0, 29.0 ],
					"samples" : 4000.0,
					"saved_attribute_attributes" : 					{
						"activelinecolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"smooth" : 2
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The index of the neural network used for predicting the amplitude of the carrier tones (acoustic signal) that results in the perception of the target harmonic signal (psychoacoustic signal) ",
					"annotation_name" : "Model Variant",
					"appearance" : 1,
					"fontsize" : 9.0,
					"id" : "obj-3",
					"lcdcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 162.808203339576721, 153.40908944606781, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 512.929824829101562, 15.685185357928276, 28.070175170898438, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_display_scale_text"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Model Variant",
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],
							"parameter_info" : "The index of the neural network used for predicting the amplitude of the carrier tones (acoustic signal) that results in the perception of the target harmonic signal (psychoacoustic signal) ",
							"parameter_linknames" : 1,
							"parameter_longname" : "Model Variant",
							"parameter_mmax" : 15,
							"parameter_modmode" : 0,
							"parameter_shortname" : "Model Variant",
							"parameter_type" : 2
						}

					}
,
					"varname" : "Model Variant"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Number of harmonics to be perceived psychoacoustically",
					"annotation_name" : "Number of Harmonics",
					"appearance" : 1,
					"fontsize" : 9.0,
					"id" : "obj-8",
					"lcdcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 255.68181574344635, 27.272727012634277, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 411.403504848480225, 15.789473533630371, 28.070175170898438, 15.0 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Number of Harmonics",
							"parameter_enum" : [ "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],
							"parameter_info" : "Number of harmonics to be perceived psychoacoustically",
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "N_Harmonics",
							"parameter_mmax" : 11,
							"parameter_modmode" : 0,
							"parameter_shortname" : "N_Harmonics",
							"parameter_type" : 2
						}

					}
,
					"varname" : "N_Harmonics"
				}

			}
, 			{
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
					"patching_rect" : [ 745.941160202026367, 320.134327530860901, 72.0, 22.0 ],
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
					"patching_rect" : [ 745.941160202026367, 297.0, 109.0, 22.0 ],
					"text" : "sprintf Error=%0.2f"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 10.013784333070781,
					"id" : "obj-23",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.308204174041748, 151.136362195014954, 84.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 441.681818842887878, 13.685185357928276, 71.318181157112122, 19.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "Model Variant",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 10.013784333070781,
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 197.727270841598511, 26.136363387107849, 58.0, 31.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 301.754383087158203, 13.685185357928276, 107.894735813140869, 19.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}

					}
,
					"text" : "Number of Harmonics",
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ -106.0, 6.0, 58.0, 22.0 ],
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
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -563.0, 396.264698028564453, 195.0, 49.0 ],
					"text" : "2000 2050 2100 2150 2200 2250 2300 2350 2400 2450 2500 2550 2600 2650 2700 2750 2800"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-34",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -311.0, 54.0, 146.0, 18.0 ],
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
					"annotation" : "Specifies the frequency of the lowest acoustically emitted tone",
					"annotation_name" : "Carrier Frequency",
					"appearance" : 4,
					"fontsize" : 9.0,
					"id" : "obj-35",
					"lcdcolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -162.0, 57.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 216.568052887916565, 43.195267379283905, 47.0, 14.772727131843567 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Carrier Frequency",
							"parameter_info" : "Specifies the frequency of the lowest acoustically emitted tone",
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
					"annotation" : "Specifies the fundamental frequency of the perceived psychoacoustic tones",
					"annotation_name" : "Target Frequency",
					"appearance" : 4,
					"fontsize" : 9.0,
					"id" : "obj-33",
					"lcdcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ -51.0, 57.0, 61.0, 15.615381360054016 ],
					"presentation" : 1,
					"presentation_rect" : [ 106.338029563426971, 42.957747042179108, 40.957747042179108, 14.788732588291168 ],
					"saved_attribute_attributes" : 					{
						"lcdcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}
,
						"valueof" : 						{
							"parameter_annotation_name" : "Target Frequency",
							"parameter_info" : "Specifies the fundamental frequency of the perceived psychoacoustic tones",
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
					"patching_rect" : [ 162.808203339576721, 120.454544305801392, 58.0, 22.0 ],
					"text" : "loadbang"
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
					"fontsize" : 9.0,
					"hint" : "The error specifying how close the perceived harmonic psychoacoustic target will be to the actual harmonics specified by the user\n  ",
					"id" : "obj-11",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 745.941160202026367, 345.507460951805115, 81.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 486.0, 174.5, 55.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_display_handle_one"
						}

					}
,
					"text" : "Error=0.00",
					"textcolor" : [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 255.68181574344635, -4.545454502105713, 58.0, 22.0 ],
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
					"presentation_rect" : [ 25.0, 196.0, 495.0, 73.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 524.999994993209839, -172.72727108001709, 88.235292434692383, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.49999988079071, 13.636363506317139, 77.0, 18.0 ],
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
					"focusbordercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"id" : "obj-10",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"orientation" : 1,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 273.134318590164185, 885.227264285087585, 136.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.352113008499146, 350.000004589557648, 99.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_output_curve_color"
						}
,
						"textcolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"tribordercolor" : 						{
							"expression" : "themecolor.live_lcd_title"
						}
,
						"trioncolor" : 						{
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
					"slidercolor" : [ 0.807843137254902, 0.807843137254902, 0.807843137254902, 0.247058823529412 ],
					"textcolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"tribordercolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"trioncolor" : [ 0.739671451839917, 0.739671266475177, 0.739671314712202, 1.0 ],
					"varname" : "Gain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 273.134318590164185, 994.318172335624695, 45.0, 45.0 ]
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
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"break_gap" : 1500.0,
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
					"presentation_rect" : [ 17.0, 40.0, 524.0, 129.0 ],
					"saved_attribute_attributes" : 					{
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
					"patching_rect" : [ 663.636357307434082, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
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
					"patching_rect" : [ 570.454540014266968, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 171.0, 533.0, 105.0 ],
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
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 618.181812286376953, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.814814910292625, 11.185185268521309, 533.185185089707375, 24.000000178813934 ],
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
					"id" : "obj-9",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 761.363629102706909, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.676056504249573, 346.478877782821655, 532.90910679101944, 32.363637328147888 ],
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
					"id" : "obj-18",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 711.363629579544067, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 38.0, 533.0, 131.0 ],
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
					"patching_rect" : [ 522.727267742156982, -140.9090895652771, 46.7741938829422, 59.677419781684875 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 559.154936909675598, 391.549300909042358 ],
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
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 755.205867767333984, 252.761719593778253, 755.441160202026367, 252.761719593778253 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 349.205875873565674, 284.965303538367152, 300.773953676223755, 284.965303538367152 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"midpoints" : [ 349.205875873565674, 270.0, 395.320881724357605, 270.0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
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
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 282.634318590164185, 939.270135879516602, 428.088862657546997, 939.270135879516602 ],
					"order" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 1 ],
					"midpoints" : [ 282.634318590164185, 969.354852676391602, 308.634318590164185, 969.354852676391602 ],
					"order" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 282.634318590164185, 912.307489395141602, 282.634318590164185, 912.307489395141602 ],
					"order" : 2,
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
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-13", 0 ]
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
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 287.773953676223755, 318.0, 395.320881724357605, 318.0 ],
					"order" : 1,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 287.773953676223755, 90.0, 349.205875873565674, 90.0 ],
					"order" : 0,
					"source" : [ "obj-22", 0 ]
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
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-25", 0 ]
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
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-27", 0 ]
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
					"destination" : [ "obj-24", 0 ],
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
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 395.320881724357605, 354.0, 395.320881724357605, 354.0 ],
					"source" : [ "obj-31", 0 ]
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
					"midpoints" : [ -152.5, 132.0, 0.0, 132.0, 0.0, 350.929871548898518, -170.5, 350.929871548898518 ],
					"order" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ -152.5, 132.0, -270.5, 132.0 ],
					"order" : 1,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 300.773953676223755, 564.0, 282.634318590164185, 564.0 ],
					"source" : [ "obj-39", 0 ]
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
					"midpoints" : [ -377.5, 201.0, -377.5, 201.0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"midpoints" : [ -270.5, 224.37109375, -377.5, 224.37109375 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 1,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"midpoints" : [ -553.5, 507.59375, 0.0, 507.59375, 0.0, 507.0, 211.5, 507.0 ],
					"order" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ -96.5, 40.34765625, -41.5, 40.34765625 ],
					"order" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"midpoints" : [ -96.5, 40.78515625, -147.0, 40.78515625, -147.0, 54.0, -152.5, 54.0 ],
					"order" : 1,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 1 ],
					"order" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"midpoints" : [ -377.5, 377.8828125, -553.5, 377.8828125 ],
					"order" : 1,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 211.5, 564.0, 282.634318590164185, 564.0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 395.320881724357605, 618.0, 282.634318590164185, 618.0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 395.320881724357605, 507.0, 395.320881724357605, 507.0 ],
					"source" : [ "obj-59", 0 ]
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
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-75", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 387.179772138595581, 797.772772550582886, 321.270681858062744, 797.772772550582886 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"midpoints" : [ 276.18181574344635, 55.458274219650775, 287.773953676223755, 55.458274219650775 ],
					"order" : 0,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 276.18181574344635, 88.894324719905853, -553.5, 88.894324719905853 ],
					"order" : 1,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-10" : [ "Gain", "Gain", 0 ],
			"obj-3" : [ "Model Variant", "Model Variant", 0 ],
			"obj-33" : [ "Target_Freq", "Target_Freq", 0 ],
			"obj-35" : [ "Target_Freq[1]", "Target_Freq", 0 ],
			"obj-5::obj-1" : [ "h14[1]", "p16", 0 ],
			"obj-5::obj-2" : [ "h13[1]", "p15", 0 ],
			"obj-5::obj-22" : [ "p1[1]", "ph2", 0 ],
			"obj-5::obj-3" : [ "h12[1]", "p14", 0 ],
			"obj-5::obj-35" : [ "p8", "p7", 0 ],
			"obj-5::obj-36" : [ "p7", "p6", 0 ],
			"obj-5::obj-37" : [ "p6", "p5", 0 ],
			"obj-5::obj-38" : [ "p5", "p4", 0 ],
			"obj-5::obj-39" : [ "p4", "p3", 0 ],
			"obj-5::obj-4" : [ "h11[1]", "p13", 0 ],
			"obj-5::obj-40" : [ "p3", "p2", 0 ],
			"obj-5::obj-41" : [ "p2", "p1", 0 ],
			"obj-5::obj-42" : [ "p1", "Car.", 0 ],
			"obj-5::obj-43" : [ "p9", "p8", 0 ],
			"obj-5::obj-46" : [ "p3[1]", "ph7", 0 ],
			"obj-5::obj-5" : [ "h10[1]", "p12", 0 ],
			"obj-5::obj-57" : [ "p5[1]", "ph13", 0 ],
			"obj-5::obj-58" : [ "p10[1]", "ph15", 0 ],
			"obj-5::obj-6" : [ "h9[1]", "p11", 0 ],
			"obj-5::obj-61" : [ "p14[1]", "ph14", 0 ],
			"obj-5::obj-62" : [ "p13[1]", "ph11", 0 ],
			"obj-5::obj-65" : [ "p12[1]", "ph8", 0 ],
			"obj-5::obj-66" : [ "p11[1]", "ph5", 0 ],
			"obj-5::obj-67" : [ "p15[1]", "ph16", 0 ],
			"obj-5::obj-68" : [ "p16[1]", "ph17", 0 ],
			"obj-5::obj-69" : [ "p9[1]", "ph12", 0 ],
			"obj-5::obj-7" : [ "h8[1]", "p10", 0 ],
			"obj-5::obj-70" : [ "p8[1]", "ph9", 0 ],
			"obj-5::obj-71" : [ "p7[1]", "ph6", 0 ],
			"obj-5::obj-72" : [ "p6[1]", "ph3", 0 ],
			"obj-5::obj-73" : [ "p4[1]", "ph10", 0 ],
			"obj-5::obj-76" : [ "p2[1]", "ph4", 0 ],
			"obj-5::obj-8" : [ "h15[1]", "p9", 0 ],
			"obj-5::obj-82" : [ "pc", "ph1", 0 ],
			"obj-63" : [ "show_piano", "show_piano", 0 ],
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
			"obj-6::obj-80" : [ "live.text[1]", "live.text[1]", 0 ],
			"obj-74" : [ "resync", "resync", 0 ],
			"obj-8" : [ "N_Harmonics", "N_Harmonics", 0 ],
			"obj-80" : [ "Link", "Link", 0 ],
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
				"obj-5::obj-22" : 				{
					"parameter_longname" : "p1[1]"
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
				"obj-5::obj-46" : 				{
					"parameter_longname" : "p3[1]"
				}
,
				"obj-5::obj-5" : 				{
					"parameter_longname" : "h10[1]"
				}
,
				"obj-5::obj-57" : 				{
					"parameter_longname" : "p5[1]"
				}
,
				"obj-5::obj-58" : 				{
					"parameter_longname" : "p10[1]"
				}
,
				"obj-5::obj-6" : 				{
					"parameter_longname" : "h9[1]"
				}
,
				"obj-5::obj-61" : 				{
					"parameter_longname" : "p14[1]"
				}
,
				"obj-5::obj-62" : 				{
					"parameter_longname" : "p13[1]"
				}
,
				"obj-5::obj-65" : 				{
					"parameter_longname" : "p12[1]"
				}
,
				"obj-5::obj-66" : 				{
					"parameter_longname" : "p11[1]"
				}
,
				"obj-5::obj-67" : 				{
					"parameter_longname" : "p15[1]"
				}
,
				"obj-5::obj-68" : 				{
					"parameter_longname" : "p16[1]"
				}
,
				"obj-5::obj-69" : 				{
					"parameter_longname" : "p9[1]"
				}
,
				"obj-5::obj-7" : 				{
					"parameter_longname" : "h8[1]"
				}
,
				"obj-5::obj-70" : 				{
					"parameter_longname" : "p8[1]"
				}
,
				"obj-5::obj-71" : 				{
					"parameter_longname" : "p7[1]"
				}
,
				"obj-5::obj-72" : 				{
					"parameter_longname" : "p6[1]"
				}
,
				"obj-5::obj-73" : 				{
					"parameter_longname" : "p4[1]"
				}
,
				"obj-5::obj-76" : 				{
					"parameter_longname" : "p2[1]"
				}
,
				"obj-5::obj-8" : 				{
					"parameter_longname" : "h15[1]"
				}
,
				"obj-5::obj-82" : 				{
					"parameter_longname" : "pc"
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
				"name" : "link.svg",
				"bootpath" : "C74:/media/max/picts/m4l-picts",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "piano_keys.svg",
				"bootpath" : "C74:/media/max/picts/m4l-picts",
				"type" : "svg",
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
				"name" : "synth_input_parser.js",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "target_amp_distribution_sliders_panel.maxpat",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "visual_feedback_linked_sliders.js",
				"bootpath" : "~/Github/qdts/max/patches/solver_nn",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
