pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__spark-main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__spark-main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E76 : Short_Integer; pragma Import (Ada, E76, "system__os_lib_E");
   E14 : Short_Integer; pragma Import (Ada, E14, "system__soft_links_E");
   E24 : Short_Integer; pragma Import (Ada, E24, "system__exception_table_E");
   E71 : Short_Integer; pragma Import (Ada, E71, "ada__io_exceptions_E");
   E56 : Short_Integer; pragma Import (Ada, E56, "ada__strings_E");
   E39 : Short_Integer; pragma Import (Ada, E39, "ada__containers_E");
   E26 : Short_Integer; pragma Import (Ada, E26, "system__exceptions_E");
   E18 : Short_Integer; pragma Import (Ada, E18, "system__secondary_stack_E");
   E58 : Short_Integer; pragma Import (Ada, E58, "ada__strings__maps_E");
   E62 : Short_Integer; pragma Import (Ada, E62, "ada__strings__maps__constants_E");
   E44 : Short_Integer; pragma Import (Ada, E44, "interfaces__c_E");
   E82 : Short_Integer; pragma Import (Ada, E82, "system__object_reader_E");
   E51 : Short_Integer; pragma Import (Ada, E51, "system__dwarf_lines_E");
   E38 : Short_Integer; pragma Import (Ada, E38, "system__traceback__symbolic_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := null;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E24 := E24 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E71 := E71 + 1;
      Ada.Strings'Elab_Spec;
      E56 := E56 + 1;
      Ada.Containers'Elab_Spec;
      E39 := E39 + 1;
      System.Exceptions'Elab_Spec;
      E26 := E26 + 1;
      System.Soft_Links'Elab_Body;
      E14 := E14 + 1;
      System.Os_Lib'Elab_Body;
      E76 := E76 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E62 := E62 + 1;
      Interfaces.C'Elab_Spec;
      System.Secondary_Stack'Elab_Body;
      E18 := E18 + 1;
      E58 := E58 + 1;
      E44 := E44 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E51 := E51 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E38 := E38 + 1;
      E82 := E82 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_spark__main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/objects/spark.o
   --   /home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/objects/spark-main.o
   --   -L/home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/objects/
   --   -L/home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/objects/
   --   -L/opt/gnat2017/lib/gcc/x86_64-pc-linux-gnu/6.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
