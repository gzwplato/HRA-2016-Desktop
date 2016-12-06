program HMRCHRA;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FrameViewer09, main, odac10, odacvcl10, dac10, lazdbexport,
  lazcontrols, rx, weblaz, DataModuleMain, SurveyLibrary,
  datamoduleSurveyLibrary, SLEdit, CustomQuestionEdit, SurveyData,
  datamoduleMessaging, Project, AccountNew, newvalues, addValues, globals,
  Messaging, SurveyItems, DBSelect, paswstring, tachartlazaruspkg,
  runtimetypeinfocontrols, GlobalTables, zedlib, SurveyItemNew, projectEdit,
  virtualtreeview_package, Account, surveyitemlist , msgjsonviewer,
datamoduleproject, orgedit, ProjectConfigEdit;

{$R *.res}

begin
  Application.Title:='HMRC HRA';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TDM_Main, DM_Main);
  Application.CreateForm(TDM_Project, DM_Project);
  Application.CreateForm(TDM_SurveyLibrary, DM_SurveyLibrary);
  Application.CreateForm(TDM_Messaging, DM_Messaging);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(Tfrm_DBSelect, frm_DBSelect);
 // Application.CreateForm(Tfrm_ProjectConfigEdit, frm_ProjectConfigEdit);
  //Application.CreateForm(Tfrm_OrgEdit, frm_OrgEdit);
  Application.Run;


end.

