pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__project-main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__project-main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E75 : Short_Integer; pragma Import (Ada, E75, "system__os_lib_E");
   E13 : Short_Integer; pragma Import (Ada, E13, "system__soft_links_E");
   E23 : Short_Integer; pragma Import (Ada, E23, "system__exception_table_E");
   E70 : Short_Integer; pragma Import (Ada, E70, "ada__io_exceptions_E");
   E55 : Short_Integer; pragma Import (Ada, E55, "ada__strings_E");
   E38 : Short_Integer; pragma Import (Ada, E38, "ada__containers_E");
   E25 : Short_Integer; pragma Import (Ada, E25, "system__exceptions_E");
   E17 : Short_Integer; pragma Import (Ada, E17, "system__secondary_stack_E");
   E57 : Short_Integer; pragma Import (Ada, E57, "ada__strings__maps_E");
   E61 : Short_Integer; pragma Import (Ada, E61, "ada__strings__maps__constants_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "interfaces__c_E");
   E81 : Short_Integer; pragma Import (Ada, E81, "system__object_reader_E");
   E50 : Short_Integer; pragma Import (Ada, E50, "system__dwarf_lines_E");
   E37 : Short_Integer; pragma Import (Ada, E37, "system__traceback__symbolic_E");

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
      E23 := E23 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E70 := E70 + 1;
      Ada.Strings'Elab_Spec;
      E55 := E55 + 1;
      Ada.Containers'Elab_Spec;
      E38 := E38 + 1;
      System.Exceptions'Elab_Spec;
      E25 := E25 + 1;
      System.Soft_Links'Elab_Body;
      E13 := E13 + 1;
      System.Os_Lib'Elab_Body;
      E75 := E75 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E61 := E61 + 1;
      Interfaces.C'Elab_Spec;
      System.Secondary_Stack'Elab_Body;
      E17 := E17 + 1;
      E57 := E57 + 1;
      E43 := E43 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E50 := E50 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E37 := E37 + 1;
      E81 := E81 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_project_main");

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
   --   /home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/obj/project-main.o
   --   -L/home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/obj/
   --   -L/home/ingrid/adalabs/interns/utm/ic/sandbox/SPARK/obj/
   --   -L/opt/gnat2017/lib/gcc/x86_64-pc-linux-gnu/6.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
