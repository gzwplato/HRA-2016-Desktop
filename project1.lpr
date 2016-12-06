program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FrameViewer09, Unit1, odac10, odacvcl10, dac10, lazdbexport,
  lazcontrols, rx, weblaz, DataModuleMain, SurveyLibrary,
  datamoduleSurveyLibrary, SLEdit, CustomQuestionEdit, SurveyData,
  datamoduleMessaging, Project, AccountNew, newvalues, addValues, globals,
  Messaging, SurveyItems, DBSelect, paswstring, tachartlazaruspkg, GlobalTables,
  zedlib, SurveyItemNew, projectEdit, virtualtreeview_package, Account, 
surveyitemlist ;

{$R *.res}

begin
  Application.Title:='HMRC HRA';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TDM_Main, DM_Main);
  Application.CreateForm(TDM_SurveyLibrary, DM_SurveyLibrary);
  Application.CreateForm(TDM_Messaging, DM_Messaging);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(Tfrm_DBSelect, frm_DBSelect);

  Application.Run;


end.

