pragma Warnings (Off);
pragma Ada_95;
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2017 (20170515-63)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_spark__main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#a1564627#;
   pragma Export (C, u00001, "spark__mainB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#5bd3bf5d#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#99ec3c77#;
   pragma Export (C, u00004, "sparkS");
   u00005 : constant Version_32 := 16#6326c08a#;
   pragma Export (C, u00005, "systemS");
   u00006 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00006, "system__memoryB");
   u00007 : constant Version_32 := 16#3a5ba6be#;
   pragma Export (C, u00007, "system__memoryS");
   u00008 : constant Version_32 := 16#a7c91b43#;
   pragma Export (C, u00008, "ada__exceptionsB");
   u00009 : constant Version_32 := 16#4b8b8db1#;
   pragma Export (C, u00009, "ada__exceptionsS");
   u00010 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00010, "adaS");
   u00011 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00013, "system__soft_linksB");
   u00014 : constant Version_32 := 16#fda218df#;
   pragma Export (C, u00014, "system__soft_linksS");
   u00015 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00015, "system__parametersB");
   u00016 : constant Version_32 := 16#1d0ccdf5#;
   pragma Export (C, u00016, "system__parametersS");
   u00017 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00017, "system__secondary_stackB");
   u00018 : constant Version_32 := 16#d9b43ff0#;
   pragma Export (C, u00018, "system__secondary_stackS");
   u00019 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00019, "system__storage_elementsB");
   u00020 : constant Version_32 := 16#4ee58a8e#;
   pragma Export (C, u00020, "system__storage_elementsS");
   u00021 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00021, "system__stack_checkingB");
   u00022 : constant Version_32 := 16#ed99ab62#;
   pragma Export (C, u00022, "system__stack_checkingS");
   u00023 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00023, "system__exception_tableB");
   u00024 : constant Version_32 := 16#3e88a9c8#;
   pragma Export (C, u00024, "system__exception_tableS");
   u00025 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00025, "system__exceptionsB");
   u00026 : constant Version_32 := 16#0b45ad7c#;
   pragma Export (C, u00026, "system__exceptionsS");
   u00027 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00027, "system__exceptions__machineB");
   u00028 : constant Version_32 := 16#047ef179#;
   pragma Export (C, u00028, "system__exceptions__machineS");
   u00029 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00029, "system__exceptions_debugB");
   u00030 : constant Version_32 := 16#1dac394e#;
   pragma Export (C, u00030, "system__exceptions_debugS");
   u00031 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00031, "system__img_intB");
   u00032 : constant Version_32 := 16#61fd2048#;
   pragma Export (C, u00032, "system__img_intS");
   u00033 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00033, "system__tracebackB");
   u00034 : constant Version_32 := 16#3d041e4e#;
   pragma Export (C, u00034, "system__tracebackS");
   u00035 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00035, "system__traceback_entriesB");
   u00036 : constant Version_32 := 16#637d36fa#;
   pragma Export (C, u00036, "system__traceback_entriesS");
   u00037 : constant Version_32 := 16#e635f7f0#;
   pragma Export (C, u00037, "system__traceback__symbolicB");
   u00038 : constant Version_32 := 16#9df1ae6d#;
   pragma Export (C, u00038, "system__traceback__symbolicS");
   u00039 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00039, "ada__containersS");
   u00040 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00040, "ada__exceptions__tracebackB");
   u00041 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00041, "ada__exceptions__tracebackS");
   u00042 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00042, "interfacesS");
   u00043 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00043, "interfaces__cB");
   u00044 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00044, "interfaces__cS");
   u00045 : constant Version_32 := 16#97d13ec4#;
   pragma Export (C, u00045, "system__address_operationsB");
   u00046 : constant Version_32 := 16#702a7eb9#;
   pragma Export (C, u00046, "system__address_operationsS");
   u00047 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00047, "system__bounded_stringsB");
   u00048 : constant Version_32 := 16#14dbe193#;
   pragma Export (C, u00048, "system__bounded_stringsS");
   u00049 : constant Version_32 := 16#13b71684#;
   pragma Export (C, u00049, "system__crtlS");
   u00050 : constant Version_32 := 16#596696a5#;
   pragma Export (C, u00050, "system__dwarf_linesB");
   u00051 : constant Version_32 := 16#e03b663a#;
   pragma Export (C, u00051, "system__dwarf_linesS");
   u00052 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00052, "ada__charactersS");
   u00053 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00053, "ada__characters__handlingB");
   u00054 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00054, "ada__characters__handlingS");
   u00055 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00055, "ada__characters__latin_1S");
   u00056 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00056, "ada__stringsS");
   u00057 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00057, "ada__strings__mapsB");
   u00058 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00058, "ada__strings__mapsS");
   u00059 : constant Version_32 := 16#cc4ff587#;
   pragma Export (C, u00059, "system__bit_opsB");
   u00060 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00060, "system__bit_opsS");
   u00061 : constant Version_32 := 16#57a0bc09#;
   pragma Export (C, u00061, "system__unsigned_typesS");
   u00062 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00062, "ada__strings__maps__constantsS");
   u00063 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00063, "system__address_imageB");
   u00064 : constant Version_32 := 16#c2ca5db0#;
   pragma Export (C, u00064, "system__address_imageS");
   u00065 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00065, "system__img_unsB");
   u00066 : constant Version_32 := 16#c85480fe#;
   pragma Export (C, u00066, "system__img_unsS");
   u00067 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00067, "system__ioB");
   u00068 : constant Version_32 := 16#fd6437c5#;
   pragma Export (C, u00068, "system__ioS");
   u00069 : constant Version_32 := 16#d6ea8de4#;
   pragma Export (C, u00069, "system__mmapB");
   u00070 : constant Version_32 := 16#59577fed#;
   pragma Export (C, u00070, "system__mmapS");
   u00071 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00071, "ada__io_exceptionsS");
   u00072 : constant Version_32 := 16#81cd5347#;
   pragma Export (C, u00072, "system__mmap__os_interfaceB");
   u00073 : constant Version_32 := 16#2af642f4#;
   pragma Export (C, u00073, "system__mmap__os_interfaceS");
   u00074 : constant Version_32 := 16#2b4924dd#;
   pragma Export (C, u00074, "system__mmap__unixS");
   u00075 : constant Version_32 := 16#05e56fce#;
   pragma Export (C, u00075, "system__os_libB");
   u00076 : constant Version_32 := 16#ed466fde#;
   pragma Export (C, u00076, "system__os_libS");
   u00077 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00077, "system__case_utilB");
   u00078 : constant Version_32 := 16#472fa95d#;
   pragma Export (C, u00078, "system__case_utilS");
   u00079 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00079, "system__stringsB");
   u00080 : constant Version_32 := 16#1d99d1ec#;
   pragma Export (C, u00080, "system__stringsS");
   u00081 : constant Version_32 := 16#d0bc914c#;
   pragma Export (C, u00081, "system__object_readerB");
   u00082 : constant Version_32 := 16#2e1565f0#;
   pragma Export (C, u00082, "system__object_readerS");
   u00083 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00083, "system__val_lliB");
   u00084 : constant Version_32 := 16#f902262a#;
   pragma Export (C, u00084, "system__val_lliS");
   u00085 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00085, "system__val_lluB");
   u00086 : constant Version_32 := 16#2d52eb7b#;
   pragma Export (C, u00086, "system__val_lluS");
   u00087 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00087, "system__val_utilB");
   u00088 : constant Version_32 := 16#cf867674#;
   pragma Export (C, u00088, "system__val_utilS");
   u00089 : constant Version_32 := 16#5bbc3f2f#;
   pragma Export (C, u00089, "system__exception_tracesB");
   u00090 : constant Version_32 := 16#47f9e010#;
   pragma Export (C, u00090, "system__exception_tracesS");
   u00091 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00091, "system__wch_conB");
   u00092 : constant Version_32 := 16#785be258#;
   pragma Export (C, u00092, "system__wch_conS");
   u00093 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00093, "system__wch_stwB");
   u00094 : constant Version_32 := 16#554ace59#;
   pragma Export (C, u00094, "system__wch_stwS");
   u00095 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00095, "system__wch_cnvB");
   u00096 : constant Version_32 := 16#77ec58ab#;
   pragma Export (C, u00096, "system__wch_cnvS");
   u00097 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00097, "system__wch_jisB");
   u00098 : constant Version_32 := 16#f79c418a#;
   pragma Export (C, u00098, "system__wch_jisS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.val_util%s
   --  system.standard_library%s
   --  system.exception_traces%s
   --  ada.exceptions%s
   --  system.wch_stw%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.os_lib%s
   --  system.bit_ops%s
   --  ada.characters.handling%s
   --  ada.exceptions.traceback%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.containers%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%s
   --  system.memory%s
   --  system.memory%b
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.standard_library%b
   --  system.exception_traces%b
   --  system.wch_stw%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.os_lib%b
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%b
   --  interfaces.c%s
   --  ada.exceptions.traceback%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  ada.exceptions.last_chance_handler%b
   --  system.mmap%s
   --  ada.strings.maps%b
   --  interfaces.c%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.object_reader%b
   --  system.mmap.os_interface%b
   --  spark%s
   --  spark.main%b
   --  END ELABORATION ORDER

end ada_main;
