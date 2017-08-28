with Options_Analyzer;

package Health.Options is

   Gender     : Gender_Type;
   Age        : Year_Type;
   Weight     : Mass_Type;
   Heart_Rate : Heart_Rate_Type;
   Minutes    : Minute_Type;
   Height     : Height_Type;

   procedure Initialize;

private

   package Analyzer is new Options_Analyzer (Binary_Options => "vh",
                                             Valued_Options => "ywrmcg",
                                             Tail_Separator => "--");

end Health.Options;
