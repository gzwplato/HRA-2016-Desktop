unit main;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, db, FileUtil, MRUList, StrHolder, IDEWindowIntf, IpHtml,
 Ipfilebroker, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls, StdCtrls,
 ComCtrls, ExtCtrls, Buttons, EditBtn, Menus, ValEdit, ActnList, HtmlView,
 fpspreadsheetctrls, fpspreadsheetgrid, OdacVcl, fpDBExport, fpstdexports,
VirtualTable, DataModuleMain,  SLEdit,
 extjsjson, fpwebdata, fphtml , DataModuleMessaging, datamoduleproject, ProjectEdit,
  Ora, OraSQLMonitor, globals, messaging, surveyitems, DBSelect,
 paswstring, RTTICtrls, GlobalTables, ZedDBTreeView, contnrs, Project, Account,
  fpjson, jsonparser , fpjsonrpc ,
   resource, versiontypes, versionresource  ,
    orgedit, ProjectConfigEdit;
type
  TDBTreeNode = class(TTreeNode)

  public
   dbkey: integer;
   dbkey2: integer;
   dbtablename : string ;
   dbdataset : TDataSet ;
   dbKeyField : string ;
   dbtablename2 : string ;
   dbdataset2 : TDataSet ;
   dbKeyField2 : string ;
//  PopUpMenu: tvNodeType;
end;
type
  //AcctOrgProj Tree:

    // level 1:  dataAccount
  // level 2:   dataOrganization
  // level 3:     dataProjectConfig_Org


  // Project Tree:
  // level 1 = DM_Project.dataProject
  // level 2  DM_Project.sqlProjectConfig_OrgInfo
  //   linked to Project, :organization_id is

  { Tfrm_Main }

  Tfrm_Main = class(TForm)
     ActionProjectConfigOrgEdit: TAction;
     ActionOrgEdit: TAction;
     Action2: TAction;
     ActionProjectForm_FromTreeProject: TAction;
     ActionSurveyLibrary: TAction;
     ActionSurveyTemplates: TAction;
    ActionAccountEdit: TAction;
    ActionNewProject: TAction;
    ActionProjectForm: TAction;
    ActionLoadProject: TAction;
    ActionList1: TActionList;
    ApplicationProperties1: TApplicationProperties;
    btnGlobalTables: TButton;
    btn_OpenDBFiles: TButton;
    btnSurveyLibrary: TButton;
    btn_Project: TButton;
    btnMessaging: TButton;
    Button3: TButton;
    Button4: TButton;
    btnSurveyTemplate: TButton;
    Button6: TButton;
    BtnLoadOrgTree: TButton;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid5: TDBGrid;
    edt_locate1: TEdit;
    edt_locateProj: TEdit;
    FPWebDataProvider1: TFPWebDataProvider;
    HtmlViewerOrgLogo: THtmlViewer;
    IDEDialogLayoutStorage1: TIDEDialogLayoutStorage;
   // IdHTTP1: TIdHTTP;
  //  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    ImageList1: TImageList;
    ImageLogo: TImage;
    Label11: TLabel;
    dsAccount: TOraDataSource;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Memo1: TMemo;
    MenuItem11: TMenuItem;
    MenuItem_EditProjConfig: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem_EditOrg1: TMenuItem;
    MenuItem_EditProjectDefault: TMenuItem;
    MenuItem_NewProject1: TMenuItem;
    MenuItem_ShowInfo1: TMenuItem;
    Panel1: TPanel;
    pnlOrgInfo: TPanel;
    PanelTop: TPanel;
    PopupMenu_TreeProject: TPopupMenu;
    SearchOrg: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem_EditProject: TMenuItem;
    MenuItem_EditOrg: TMenuItem;
    MenuItem_NewAccount: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem_ShowInfo: TMenuItem;
    MenuItem_NewProject: TMenuItem;
    MenuItem_EditAccount: TMenuItem;
    MenuItem_NewOrganization: TMenuItem;
    MRUManager1: TMRUManager;
    dsOrg: TOraDataSource;
    OraSQLMonitor1: TOraSQLMonitor;
    PageControl1: TPageControl;
    pnl_AccountMain: TPanel;
    pnl_SearchAcctName: TPanel;
    pnl_accountLeft: TPanel;
    pnl_AccountTop: TPanel;
    pnlOptions: TPanel;
    pnl_SearchAcctName1: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu_Tree: TPopupMenu;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Splitter1: TSplitter;
    StatusBar2: TStatusBar;
    StrHolder1: TStrHolder;
    tb_AccountProject: TTabSheet;
    tb_EnvVars: TTabSheet;
    TVJSON: TTreeView;
    TreeView_AcctOrgProj: TTreeView;
    TreeView_Project: TTreeView;
    ValueListEditor1: TValueListEditor;
    procedure ActionAccountEditExecute(Sender: TObject);
    procedure ActionLoadProjectExecute(Sender: TObject);
    procedure ActionNewProjectExecute(Sender: TObject);
    procedure ActionOrgEditExecute(Sender: TObject);
    procedure ActionProjectConfigOrgEditExecute(Sender: TObject);
    procedure ActionProjectFormExecute(Sender: TObject);
    procedure ActionProjectForm_FromTreeProjectExecute(Sender: TObject);
    procedure ActionSurveyLibraryExecute(Sender: TObject);
    procedure ActionSurveyTemplatesExecute(Sender: TObject);
    procedure ApplicationProperties1Activate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnGlobalTablesClick(Sender: TObject);
    procedure btnMessagingClick(Sender: TObject);
    procedure btnNewProjectClick(Sender: TObject);
    procedure btnSurveyTemplateClick(Sender: TObject);
    procedure btntestClick(Sender: TObject);
    procedure btn_Project1Click(Sender: TObject);
    procedure btn_Project2Click(Sender: TObject);
    procedure btn_Project3Click(Sender: TObject);
    procedure btn_Project5Click(Sender: TObject);
    procedure btn_ProjectClick(Sender: TObject);
    procedure btn_OpenDBFilesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSurveyLibraryClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btn_FilterClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BtnLoadOrgTreeClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource1UpdateData(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure dsAccountDataChange(Sender: TObject; Field: TField);
    procedure edt_FilterChange(Sender: TObject);
    procedure edt_locate1Change(Sender: TObject);
    procedure edt_locateChange(Sender: TObject);
    procedure edt_locateClick(Sender: TObject);
    procedure edt_locateProjChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem_EditProjConfigClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem_EditAccountClick(Sender: TObject);
    procedure MenuItem_ShowInfo1Click(Sender: TObject);
    procedure MenuItem_ShowInfoClick(Sender: TObject);
    procedure MRUManager1Change(Sender: TObject);
    procedure dsOrgDataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure SimpleJSONExporter1ExportRow(Sender: TObject;
      var AllowExport: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SynMemo1Change(Sender: TObject);
    procedure TreeView_AcctOrgProjExpanded(Sender: TObject; Node: TTreeNode);
    procedure TreeView_AcctOrgProjExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeView_ProjectChange(Sender: TObject; Node: TTreeNode);
    procedure TreeView_ProjectCollapsed(Sender: TObject; Node: TTreeNode);
    procedure TreeView_ProjectCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure TreeView_ProjectDeletion(Sender: TObject; Node: TTreeNode);
    procedure TreeView_AcctOrgProjChange(Sender: TObject; Node: TTreeNode);
    procedure TreeView_AcctOrgProjClick(Sender: TObject);
    procedure TreeView_AcctOrgProjCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure TreeView_AcctOrgProjCustomDraw(Sender: TCustomTreeView; const ARect: TRect;
      var DefaultDraw: Boolean);
    procedure TreeView_AcctOrgProjCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeView_AcctOrgProjDeletion(Sender: TObject; Node: TTreeNode);
    procedure TreeView_AcctOrgProjGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView_AcctOrgProjSelectionChanged(Sender: TObject);

      procedure ZedDBTreeView_AllOrgsCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
      procedure ZedDBTreeView_OrgWProjectCustomDrawItem(
        Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
        var DefaultDraw: Boolean);
//    procedure HMLTVCreateNodeClass(Sender: TCustomTreeView);
    function DBTreeNode(Node:TTreeNode):TDBTreeNode;
    procedure LoadAcctOrgProjIntoTree();
    procedure LoadOrgProjectIntoTree();
    procedure LoadProjectIntoTree();
    procedure ProjectForm(projectkey: Integer);
    procedure ShowJSONData(AParent : TTreeNode; Data : TJSONData);
    procedure ShowJSONDocument(jData : TJSONData);
    FUNCTION  resourceVersionInfo: STRING;
   private


         FRoot : TJSONData;
    FFileName : String;
    FSortObjectMembers,
    FStrict,
    FNewObject,
    FModified : Boolean;
    FCurrentFind : TTreeNode;
    { private declarations }
  public
        bLoadOrgTree : boolean ;
    EnvVars : TStringList ;
       updateFromTree : boolean ;
     app : TApplication;
     procedure OpenDBFiles();



    { public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation
   uses  msgjsonviewer, clipbrd;


Const
  ImageTypeMap : Array[TJSONtype] of Integer =
//      jtUnknown, jtNumber, jtString, jtBoolean, jtNull, jtArray, jtObject
     (-1,8,9,7,6,5,4);
  JSONTypeNames : Array[TJSONtype] of string =
     ('Unknown','Number','String','Boolean','Null','Array','Object');

  {$R *.lfm}

{ Tfrm_Main }

procedure Tfrm_Main.btn_OpenDBFilesClick(Sender: TObject);
var
   lf : string;
begin

  OpenDBFiles();

end;

procedure Tfrm_Main.Button1Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.btn_ProjectClick(Sender: TObject);
begin
   frm_ProjectEdit := Tfrm_ProjectEdit.create(nil);

   frm_ProjectEdit.ShowModal;

   FreeAndNil(frm_ProjectEdit);
end;

procedure Tfrm_Main.BitBtn1Click(Sender: TObject);
begin

  DBGrid1.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColumnMove,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
//  DBNavigator_Acct.visible := NOT( DBNavigator_Acct.visible);
 // DBNavigator_Org.visible := NOT( DBNavigator_Org.visible);

{  if (DBNavigator_Acct.visible) then
  begin
       DBGrid1.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColumnMove,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

  end else
  begin
       DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColumnMove,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

  end;
 }

end;

procedure Tfrm_Main.ActionLoadProjectExecute(Sender: TObject);
begin
  // level 1:  dataAccount
  // level 2:   dataOrganization
  // level 3:     dataProjectConfig_Org


     // level 1 = DM_Project.dataProject
  // level 2  DM_Project.sqlProjectConfig_OrgInfo
     TreeView_Project.items.clear;
    TreeView_Project.Items.FreeAllNodeData ;

    TreeView_AcctOrgProj.Items.Clear;
    TreeView_AcctOrgProj.Items.FreeAllNodeData;
 // OpenDBFiles();
  with DM_Main, DM_Project do
   begin
     dataAccount.active := false ;
     dataOrganization.active := false ;
     dataProjectConfig_Org.active := false ;

     DM_Project.dataProject.active := false ;
     sqlProjectConfig_OrgInfo.active := false ;

    dataProjectConfig.active := false ;
    dataOrg_wProject.active := false;



     dataAccount.active := true ;
     dataOrganization.active := true ;
     dataProjectConfig_Org.active := true ;

    DM_Project.dataProject.active := true ;
    sqlProjectConfig_OrgInfo.active := true ;

     dataProjectConfig.active := true ;
    dataOrg_wProject.active := true;
   end;

   LoadAcctOrgProjIntoTree();
end;

procedure Tfrm_Main.ActionAccountEditExecute(Sender: TObject);
begin
  frm_Account  := Tfrm_Account.create(nil);
 frm_Account.ShowModal;
 FreeAndNil(frm_Account);
end;

procedure Tfrm_Main.ActionNewProjectExecute(Sender: TObject);
var
    result  : integer ;
    Node: TTreeNode;
begin

    DM_Project.dataProject.Append ;
    frm_Project := Tfrm_Project.create(nil);
    result := frm_Project.ShowModal;
    FreeAndNil(frm_Project);
    if result = mrOK then
    begin
     //new project
        ActionLoadProjectExecute(nil);

      with DM_Main.dataAccount    do
      begin

        locate('account_ID', globals.tAccount_ID, [loPartialKey, loCaseInsensitive]);
        node := TreeView_AcctOrgProj.items.FindNodeWithText(DM_Main.dataAccountACCOUNTNAME.asString);
           //node := TreeView_AcctOrgProj.Items.FindNodeWithData( ?? );
        node.Selected:= true;
      end;
    end;
end;

procedure Tfrm_Main.ActionOrgEditExecute(Sender: TObject);
begin
   frm_OrgEdit  := Tfrm_OrgEdit.create(nil);
 frm_OrgEdit.ShowModal;
 FreeAndNil(frm_OrgEdit);
end;

procedure Tfrm_Main.ActionProjectConfigOrgEditExecute(Sender: TObject);
begin
    frm_ProjectConfigEdit  := Tfrm_ProjectConfigEdit.create(nil);


     frm_ProjectConfigEdit.ShowModal;
     FreeAndNil(frm_ProjectConfigEdit);
end;

procedure Tfrm_Main.ActionProjectFormExecute(Sender: TObject);
 var
     key: integer ;
     keyfield : string ;
begin

    if TreeView_AcctOrgProj.Selected.Level > 2 then
    begin
         key := DBTreeNode(TreeView_AcctOrgProj.Selected).dbkey2;
         keyField :=  DBTreeNode(TreeView_AcctOrgProj.Selected).dbKeyField;
         if lowerCase(keyfield) = 'projectconfig_id' then
           ProjectForm(key);
    end;


end;

procedure Tfrm_Main.ActionProjectForm_FromTreeProjectExecute(Sender: TObject);
  var
     key: integer ;
     keyfield : string ;
begin
    if TreeView_Project.Selected.Level = 1 then
    begin
         key := DBTreeNode(TreeView_Project.Selected).dbkey;
         keyField :=  DBTreeNode(TreeView_Project.Selected).dbKeyField;
         if lowerCase(keyfield) = 'project_id' then
           ProjectForm(key);
    end;
    if TreeView_Project.Selected.Level = 2 then
    begin
         key := DBTreeNode(TreeView_Project.Selected.parent).dbkey;
         keyField :=  DBTreeNode(TreeView_Project.Selected.parent).dbKeyField;
         if lowerCase(keyfield) = 'project_id' then
         ProjectForm(key);
    end;
end;

procedure Tfrm_Main.ActionSurveyLibraryExecute(Sender: TObject);
begin
  hide;
    frm_SurveyItems   := Tfrm_SurveyItems.create(nil);
    frm_SurveyItems.ShowModal;
    FreeAndNil(frm_SurveyItems);
   frm_Main.show ;
end;

procedure Tfrm_Main.ActionSurveyTemplatesExecute(Sender: TObject);
begin
  frm_SurveyItems   := Tfrm_SurveyItems.create(nil);
   frm_SurveyItems.ShowModal;
   FreeAndNil(frm_SurveyItems);
end;

procedure Tfrm_Main.ApplicationProperties1Activate(Sender: TObject);
begin

end;

procedure Tfrm_Main.btnGlobalTablesClick(Sender: TObject);
begin
   frm_GlobalTables := Tfrm_GlobalTables.create(nil);

   frm_GlobalTables.ShowModal;

   FreeAndNil(frm_GlobalTables);
end;

procedure Tfrm_Main.btnMessagingClick(Sender: TObject);
begin
    frmMessaging := TfrmMessaging.create(nil);

   frmMessaging.ShowModal;

   FreeAndNil(frmMessaging);
end;

procedure Tfrm_Main.btnNewProjectClick(Sender: TObject);
begin


end;

procedure Tfrm_Main.btnSurveyTemplateClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.btntestClick(Sender: TObject);
var UTF8TestString: string;
begin

 //messa
UTF8TestString:= 'rosé, водка and ούζο （在过去的生日）';

// edit1.Caption:= UTF8TestString;
//messagetext ('plain: ' + UTF8TestString);

end;

procedure Tfrm_Main.btn_Project1Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.btn_Project2Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.btn_Project3Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.btn_Project5Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.btnSurveyLibraryClick(Sender: TObject);
begin




  //frm_SurveyLibrary := Tfrm_SurveyLibrary.create(nil);
  //frm_SurveyLibrary.ShowModal;
  //FreeAndNil(frm_SurveyLibrary);
end;


procedure Tfrm_Main.btn_FilterClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.Button4Click(Sender: TObject);

 var http: variant;
     sJson : string ;
      jData : TJSONData;
   jObject : TJSONObject;
   jArray : TJSONArray;
begin



// sJson := IdHTTP1.Get('http://hmrc-api.miserver.it.umich.edu/api/v2/sgapi/2210782/surveypage/3?api_key=4dafae9755f681fd4bad54d1ef91be1a27b8d0e25f26d9acae0de58bb8ab21f9');
// memo1.Text:= sJson;
// jData := GetJSON(sJson);
 //   ShowJsonDocument(jData);
//   jData := GetJSON('{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}');
// http.open('GET', 'http://hmrc-api.miserver.it.umich.edu/api/v2/sgapi/2210782/surveypage/3?api_key=4dafae9755f681fd4bad54d1ef91be1a27b8d0e25f26d9acae0de58bb8ab21f9', false);
 //http.send;
 //showmessage(http.responsetext);


end;

procedure Tfrm_Main.Button5Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.Button6Click(Sender: TObject);
var
   tNode , tNodeSib, tNodeChild, tNodeSelected, tNodeCurrent : TTreeNode ;
   bNoChild : boolean;
begin

end;

procedure Tfrm_Main.BtnLoadOrgTreeClick(Sender: TObject);
begin

 With DM_Project do
  begin
    // level 1 = DM_Project.dataProject
    // level 2  DM_Project.sqlProjectConfig_OrgInfo
    DM_Project.sqlProjectConfig_OrgInfo.active := false;
    DM_Project.sqlProjectConfig_OrgInfo.active := true;
    LoadProjectIntoTree();
  end;

end;

procedure Tfrm_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure Tfrm_Main.DataSource1UpdateData(Sender: TObject);
begin
    //D
  showmessage('update: '+DM_Main.dataAccount.fieldbyname('account_id').asString);

end;

procedure Tfrm_Main.DBEdit3Change(Sender: TObject);
begin

end;

procedure Tfrm_Main.dsAccountDataChange(Sender: TObject; Field: TField);
begin
  //if DM_Main.dataProject.active then
 //if (bLoadOrgTree = true) and  (DM_Main.dataProject.active ) then;
  //LoadOrgProjectIntoTree();

   if TreeView_Project.Items.Count > 0 then
   if DBTreeNode(TreeView_Project.Items.GetFirstNode).dbKey <> DM_Main.dataAccountACCOUNT_ID.asInteger then
      LoadProjectIntoTree();
end;

procedure Tfrm_Main.edt_FilterChange(Sender: TObject);
begin

end;

procedure Tfrm_Main.edt_locate1Change(Sender: TObject);
var
Node: TTreeNode;

begin
  with DM_Main.dataAccount    do
  begin
     locate('accountname', edt_locate1.text, [loPartialKey, loCaseInsensitive]);

    node := TreeView_AcctOrgProj.items.FindNodeWithText(DM_Main.dataAccountACCOUNTNAME.asString);
    //node := TreeView_AcctOrgProj.Items.FindNodeWithData( ?? );
    node.Selected:= true;

  end;
end;

procedure Tfrm_Main.edt_locateChange(Sender: TObject);
begin

end;

procedure Tfrm_Main.edt_locateClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.edt_locateProjChange(Sender: TObject);
  var
   Node: TTreeNode;
   sFindText : string ;
begin

  with DM_Project.dataProject do
  begin
   if   locate('ProjectName', edt_locateProj.text, [loPartialKey, loCaseInsensitive]) then
   begin
       sFindText :=  FieldByName('ProjectName').asString ;
       sFindText := sFindText + ' ['+FieldByName('PRODUCTCODE').AsString+':';
       sFindText := sFindText +  FieldByName('Version').AsString+'] ' ;
       node := TreeView_Project.items.FindNodeWithText(sFindText);
         //node := TreeView_AcctOrgProj.Items.FindNodeWithData( ?? );
       if node <> nil then
          node.Selected:= true;
    end;
  end;
end;



procedure Tfrm_Main.FormActivate(Sender: TObject);
begin
    if not globals.ExitApplication then
     LoadAcctOrgProjIntoTree();
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
var
I: Integer;
key, version : string ;
begin
  EnvVars := TStringList.create ;

  pageControl1.ActivePage := tb_AccountProject;

//  ValueListEditor1. := EnvVars ;
  //showMessage((Application.Params[0]));
  For i := 0 to Application.ParamCount  do
  begin
   //  showMessage(Application.Params[i]);
  end;
 try
     Application.GetEnvironmentList(EnvVars);

     For i := 1 to Envvars.count - 1 do
     begin
         key:=EnvVars.Names[i];
           ValueListEditor1.Keys[i] := key;
           ValueListEditor1.Values[key] := EnvVars.ValueFromIndex[i];

           if key = 'USERNAME' then
               globals.UserName:= EnvVars.ValueFromIndex[i];
           if key = 'USERDNSDOMAIN' then
               globals.DNSDomain := EnvVars.ValueFromIndex[i];
           if key = 'COMPUTERNAME' then
               globals.Computername := EnvVars.ValueFromIndex[i];

          //ValueListEditor1.InsertRow(key,EnvVars.ValueFromIndex[i],true);

          //ValueListEditor1.InsertRow();
     end;
      ListBox1.Items := EnvVars;


    // For I:=1 to GetEnvironmentVariableCount do
       //showMessage(GetEnvironmentString(i));

 finally

 end;
 //OraS := TOraSession.Create(DM_Main);
 //OraS := DM_Main.OraSession_DEV;



 TRY
   frm_DBSelect := Tfrm_DBSelect.create(nil);
   frm_DBSelect.ShowModal;

   //if frm_DBSelect.rg_DBVersion.ItemIndex = 0 then
   //begin
   //   showmessage('DEV');
   //end;
 FINALLY
  FreeAndNil(frm_DBSelect);
 end;
 if globals.ExitApplication then
   exit ;
//DM_Main.OraSessionMain.connected := false ;

 TRY
    WITH   DM_MAIN do
    begin
          SP_HMRC_USER_VERIFY.ParamByName('puniquename').ASString := globals.UserName;
          SP_HMRC_USER_VERIFY.Execute;
          IF SP_HMRC_USER_VERIFY.ParamByName('pAccessLevel').AsInteger > 0 then
          begin
               globals.UserAccessLevel:= SP_HMRC_USER_VERIFY.ParamByName('pAccessLevel').AsInteger;
               //ShowMessage('Access level: '+IntToStr( globals.UserAccessLevel));

          end else
          begin
                ShowMessage('Invalid or inactive user '+globals.UserName+' ... will exit program!');
                Application.Terminate;
          end;
    end;

 finally
 end;

  Caption := caption + ' USER: '+globals.Username+'  [DB: '+globals.DBType+']';
  //Caption := caption + '  version: '+Application.;
  version := resourceVersionInfo;
  Caption := caption + '  '+version;


  OpenDBFiles();




end;

procedure Tfrm_Main.FormDblClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.FormDestroy(Sender: TObject);
begin
   EnvVars.Free;
end;

procedure Tfrm_Main.MenuItem_EditProjConfigClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.MenuItem2Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.MenuItem6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_Main.MenuItem7Click(Sender: TObject);
begin
  pnlOptions.visible := NOT(pnlOptions.visible);
end;

procedure Tfrm_Main.MenuItem_EditAccountClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.MenuItem_ShowInfo1Click(Sender: TObject);
begin
  ShowMessage('Key: '+ IntToStr(DBTreeNode(TreeView_Project.selected).dbkey)+' DataSet: '+DBTreeNode(TreeView_Project.selected).dbdataset.name);

end;

procedure Tfrm_Main.MenuItem_ShowInfoClick(Sender: TObject);
begin
      ShowMessage('Key: '+ IntToStr(DBTreeNode(TreeView_AcctOrgProj.selected).dbkey)+' DataSet: '+DBTreeNode(TreeView_AcctOrgProj.selected).dbdataset.name+' Key2 '+IntToStr(DBTreeNode(TreeView_AcctOrgProj.selected).dbkey2));
     //  ShowMessage( DBTreeNode(TreeView_AcctOrgProj.selected).dbtablename);
end;

procedure Tfrm_Main.MRUManager1Change(Sender: TObject);
begin

end;

procedure Tfrm_Main.dsOrgDataChange(Sender: TObject; Field: TField);
begin
   ImageLogo.Picture.Graphic.Clear  ;
    ImageLogo.visible := true ;
  if DM_Main.dataOrganizationORGNAMEID.asString = 'hbg' then
    ImageLogo.Picture.LoadFromFile('images/healthybizgrp.gif');
  if DM_Main.dataOrganizationORGNAMEID.asString = 'allegiance' then
    ImageLogo.Picture.LoadFromFile('images/allegiance.gif');

 // HtmlViewerOrgLogo.URL := 'http://www.activeu.org/sites/default/files/mhealthylogo.jpg';

 // HtmlViewerOrgLogo.URL:= 'http://www.hmrc.kines.umich.edu/hra/img/icon/advocate.gif';

end;

procedure Tfrm_Main.PageControl1Change(Sender: TObject);
begin

end;

procedure Tfrm_Main.SimpleJSONExporter1ExportRow(Sender: TObject;
  var AllowExport: Boolean);
begin

end;

procedure Tfrm_Main.SpeedButton1Click(Sender: TObject);
begin
   pnlOptions.visible := NOT(pnlOptions.visible);
end;

procedure Tfrm_Main.SpeedButton2Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure Tfrm_Main.SynMemo1Change(Sender: TObject);
begin

end;

procedure Tfrm_Main.TreeView_AcctOrgProjExpanded(Sender: TObject;
  Node: TTreeNode);
begin

end;

procedure Tfrm_Main.TreeView_AcctOrgProjExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);

  var
 table : string ;
 key : integer ;
 dataSet : TDataSet ;
 keyfield : string ;
 nextnode, parentnode, childnode : TTreeNode;

 i, iL : integer ;
 bFound : boolean ;
 treeList: TFPObjectList ;
begin
 // level 1:  dataAccount
  // level 2:   dataOrganization
  // level 3:     dataProjectConfig_Org

if node <> nil then
begin
  nextnode  := node.GetNextSkipChildren;

  MenuItem_EditAccount.Enabled := false ;
  MenuItem_EditOrg.enabled := false;
  MenuItem_EditProject.enabled := false ;
  MenuItem_NewAccount.enabled := false ;
  MenuItem_NewOrganization.enabled := false ;
  MenuItem_NewProject.enabled := false ;

    if nextnode <> nil then
    nextnode.MakeVisible;


  if node.Level >= 0 then
  begin
        MenuItem_NewAccount.enabled := true ;

  end;

  if node.Level >= 1 then
  begin
         MenuItem_EditAccount.Enabled := true ;
         MenuItem_NewOrganization.enabled := true ;
         MenuItem_NewProject.enabled := true ;


  end;
  if node.level >= 2 then
  Begin
      MenuItem_EditOrg.enabled := true ;
   end;
  if node.Level > 2 then
     MenuItem_EditProject.Enabled := true else
     MenuItem_EditProject.Enabled := false;

  //if node.Level = 0 then
  //begin
  //    if  node.HasChildren then
  //    begin
  //      MenuItem_EditProject.enabled := true ;
  //
  //    end else
  //    begin
  //      MenuItem_EditProject.enabled := false ;
  //
  //    end;
  //end;

 // after recreating tree, node becomes nil

  table :=   DBTreeNode(node).dbtablename;
  key :=      DBTreeNode(node).dbkey;
  dataSet :=  DBTreeNode(node).dbdataset;
  keyfield :=    DBTreeNode(node).dbKeyField;

  if table <> '' then
  begin
      bFound := dataSet.Locate(keyfield,key,[]);
      if not (bFound) then
      try
         // go back through tree to get correct parent/child database relationship

          treeList := TFPObjectList.Create(false);

          iL := node.Level ;

        for i := iL downto 1 do
        begin
            if i = iL then
              nextNode := node else
              nextNode := nextNode.Parent;
              treeList.Add(nextNode);
        end;
        For i := treelist.Count-1 downto 0 do
        begin;
           nextnode := treeList.Items[i] AS TTreeNode;


           table :=   DBTreeNode(nextnode).dbtablename;
           key :=      DBTreeNode(nextnode).dbkey;
           dataSet :=  DBTreeNode(nextnode).dbdataset;
           keyfield :=    DBTreeNode(nextnode).dbKeyField;
           if table <> '' then
           begin
              bFound := dataSet.Locate(keyfield,key,[]);
              if not bFound then
                 showMessage('ERROR: not found '+keyfield+' '+table);
           end;
        end;


      finally
         //treeList.Destroy;
         treeList.Free ;
      end;

  end;
    if node.level = 0 then
   begin
         TreeView_Project.Items.Clear;
        TreeView_Project.Items.FreeAllNodeData;

   end;
   if node.level = 1 then
   begin
   //!!!!!   LoadOrgProjectIntoTree();
      LoadProjectIntoTree();
   end;
 end;

end;

procedure Tfrm_Main.TreeView_ProjectChange(Sender: TObject; Node: TTreeNode);
var
   table : string ;
    key, key2 : integer ;
    dataSet : TDataSet ;
    keyfield : string ;
    nextnode, parentnode, childnode : TTreeNode;

    i, iL : integer ;
    bFound : boolean ;
    treeList: TFPObjectList ;
begin
 MenuItem_EditProjConfig.enabled := false ;
 if Node <> nil then
 begin
       if node.Level < 1 then
          MenuItem_EditProjectDefault.Enabled:= false else
          MenuItem_EditProjectDefault.Enabled:= true;


       if node.Level > 1 then
       begin
         table :=   DBTreeNode(node).dbtablename;
         key :=      DBTreeNode(node).dbkey;
         dataSet :=  DBTreeNode(node).dbdataset;
         keyfield :=    DBTreeNode(node).dbKeyField;
         key2 :=    DBTreeNode(node).dbkey2;
         with  dataset do
         begin
            bfound := locate(keyfield,key,[]);
            if key2 > 0 then
            begin
                 MenuItem_EditProjConfig.enabled := true ;
                 MenuItem_EditProjectDefault.enabled := false ;
            end else
               MenuItem_EditProjectDefault.enabled := true ;



         end;
       end;

 end;

 {
  dbkey := FieldByName('projectconfig_id').asinteger ;
    dbkey2 := FieldByName('organization_id').asinteger ;
    dbtablename := 'CORE_PROJECTCONFIG';
    dbdataSet := sqlProjectConfig_OrgInfo ;
    dbKeyField:= 'projectconfig_id';
 }

 {if table <> '' then
 begin
     bFound := dataSet.Locate(keyfield,key,[]);
     if not (bFound) then
     try
        // go back through tree to get correct parent/child database relationship

         treeList := TFPObjectList.Create(false);

         iL := node.Level ;

       for i := iL downto 1 do
       begin
           if i = iL then
             nextNode := node else
             nextNode := nextNode.Parent;
             treeList.Add(nextNode);
       end;
       For i := treelist.Count-1 downto 0 do
       begin;
          nextnode := treeList.Items[i] AS TTreeNode;


          table :=   DBTreeNode(nextnode).dbtablename;
          key :=      DBTreeNode(nextnode).dbkey;
          dataSet :=  DBTreeNode(nextnode).dbdataset;
          keyfield :=    DBTreeNode(nextnode).dbKeyField;
          if table <> '' then
          begin
             bFound := dataSet.Locate(keyfield,key,[]);
             if not bFound then
                showMessage('ERROR: not found '+keyfield+' '+table);
          end;
       end;


     finally
        //treeList.Destroy;
        treeList.Free ;
     end;

 end;
 }
end;

procedure Tfrm_Main.TreeView_ProjectCollapsed(Sender: TObject;
  Node: TTreeNode);
begin

end;

procedure Tfrm_Main.TreeView_ProjectCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
   NodeClass := TDBTreeNode ;
end;

procedure Tfrm_Main.TreeView_ProjectDeletion(Sender: TObject; Node: TTreeNode
  );
begin
    TDBTreeNode(Node.Data).Free;
end;



procedure Tfrm_Main.TreeView_AcctOrgProjClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.TreeView_AcctOrgProjCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin

   NodeClass := TDBTreeNode ;

end;

procedure Tfrm_Main.TreeView_AcctOrgProjCustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
begin

end;

procedure Tfrm_Main.TreeView_AcctOrgProjCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
    //if node.Level = 0 then
    // Node.ImageIndex:= 1;
    //if node.Level = 1 then
    // Node.ImageIndex :=
    //
    //if   COPY(node.Text,1,7) = '[GROUP]' then
    //  Node.ImageIndex:= 7;
    // if   COPY(node.Text,1,10) = '[SubGroup]' then
    //  Node.ImageIndex:= 9;
end;

procedure Tfrm_Main.TreeView_AcctOrgProjDeletion(Sender: TObject; Node: TTreeNode);
begin
   TDBTreeNode(Node.Data).Free;
end;

procedure Tfrm_Main.TreeView_AcctOrgProjGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin

end;

procedure Tfrm_Main.TreeView_AcctOrgProjSelectionChanged(Sender: TObject);
begin


end;



procedure Tfrm_Main.ZedDBTreeView_AllOrgsCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   if node.Level = 0 then
     Node.ImageIndex:= 1;
    if   COPY(node.Text,1,7) = '[GROUP]' then
      Node.ImageIndex:= 7;
     if   COPY(node.Text,1,10) = '[SubGroup]' then
      Node.ImageIndex:= 9;
  //  if Assigned(ZedDBTreeView_AllOrgs.Selected) then
    // begin


     //end;
end;

procedure Tfrm_Main.ZedDBTreeView_OrgWProjectCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
   if node.Level = 0 then
     Node.ImageIndex:= 1;
    if   COPY(node.Text,1,7) = '[GROUP]' then
      Node.ImageIndex:= 7;
    if   COPY(node.Text,1,10) = '[SubGroup]' then
      Node.ImageIndex:= 9;
end;

procedure Tfrm_Main.OpenDBFiles();
var
   lf : string;
begin
  bLoadOrgTree:= false ;
  With DM_Main , DM_Project do
  begin
    OraSessionMain.Connected := false;
  dataProduct.active := false ;
     dataProductVersion.active := false ;
     luProductVersion.active := false ;

     dataAccount.active := false ;
     dataOrganization.active := false ;
     dataProject.active := false ;


       dataProjectConfig_DEFAULT.Active := false ;
    // dataProjectConfig_HRA_DEFAULT.active := false ;
     dataSurvey_SurveyItem_DEFAULT.active := false ;

     dataProjectConfig.Active := false ;
    // dataProjectConfig_HRA.active := false ;
     dataSurvey_SurveyItem.active := false ;

     //dataProjectProduct.active := false;
     //dataProjectProductOrg.active := false ;

     dataLanguage.active := false ;

       dataOrg_wProject.active := false;

     dataAccount_Org.active := false ;
     dataAcct_Org_wProject.active := false ;
     dataProjectForOrg.active := false ;
     dataProjectConfigForOrg.active := false ;
     dataProdForOrgProject.active := false ;

     luStatus.active := false;
     luProjectGroup.active := false ;
     lu_Account_Type.active := false ;

     //---**** OPEN TABLES


    OraSessionMain.Connected := true;

     dataProduct.active := true ;
     dataProductVersion.active := true ;
     luProductVersion.active := true ;

     dataAccount.active := true ;
     dataOrganization.active := true ;
     dataProject.active := true ;

       dataProjectConfig_DEFAULT.Active := true ;
    // dataProjectConfig_HRA_DEFAULT.active := true ;
     dataSurvey_SurveyItem_DEFAULT.active := true ;

     dataProjectConfig.Active := true ;
   //  dataProjectConfig_HRA.active := true ;
     dataSurvey_SurveyItem.active := true ;

     //dataProjectProduct.active := true;
     //dataProjectProductOrg.active := true ;
     //
     dataLanguage.active := true ;

     dataOrg_wProject.active := true;

     dataAccount_Org.active := true ;
     dataAcct_Org_wProject.active := true ;

     dataProjectForOrg.active := true ;
     dataProjectConfigForOrg.active := true ;
     dataProdForOrgProject.active := true ;

     luStatus.active := true;
     luProjectGroup.active := true ;
     lu_Account_Type.active := true ;

  //While Not dataAccount.eof do
  //begin
  //   lf := dataAccount.FieldByName('AccountName').asString ;
  //   Memo1.lines.add(lf);
  //   dataAccount.next ;
  //
  //end;
  //dataAccount.First ;

  //  XMLXSDExporter1.Execute;
  //simpleJsonExporter1.execute ;
  //simpleXMLExporter1.execute;
    dataAccount.First ;
  end;

  With DM_Messaging do
  begin
   data_MessagingCriteria.active := false ;
   data_MessagingCriteria.params[0].value := 1; //
    data_MessagingCriteria.active := true ;
  end;

end;

function Tfrm_Main.DBTreeNode(Node:TTreeNode):TDBTreeNode;
begin
  result := TDBTreeNode(Node); //you could even use AS here for extra safety
end;

procedure Tfrm_Main.ProjectForm(projectkey: integer );
begin

  with DM_Project.dataProject
  do begin

   if locate('project_id', projectkey,[]) then
   begin

        frm_ProjectEdit := Tfrm_ProjectEdit.create(nil);
        frm_ProjectEdit.ShowModal;
        FreeAndNil(frm_ProjectEdit);
    end;
   end;


end;


procedure Tfrm_Main.LoadOrgProjectIntoTree();
var
   tRoot, tNode , tNodeSib, tNodeChild, tNodeSelected, tNodeCurrent, tNodeOrg : TTreeNode ;
   bNoChild : boolean;
   iLoop : integer ;
   sLabel : string ;
   bDefaultOrg : boolean;
   bProjectConfigActive : boolean ;
   bProjectConfigIsClosed : boolean ;
   bProjectActive : boolean ;
begin
  // level 1 = DM_Main.dataOrganization
  // level 2 dataProjectConfig_Org
   updateFromTree:= false;
   with DM_Main, DM_Project do
   begin
    dataProjectConfig_Org.active := true;
   end;

    TreeView_Project.Items.Clear;
    TreeView_Project.Items.FreeAllNodeData;

    tRoot := TreeView_Project.Items.Add(nil,'Organizations | Projects') ;



    TreeView_Project.BeginUpdate;
    with DBTreeNode(tRoot) do
     begin
         dbkey := -1;
         dbkey2 := -1 ;
         dbtablename := '';
         dbdataset := DM_Main.dataOrganization;
         dbKeyField:= '';
     end  ;


    With DM_Main, DM_Project do
    begin
         dataOrganization.first ;
         while not dataOrganization.eof do
         begin
                // LEVEL 1
                bNoChild := False ;
                bDefaultOrg := false ;
                if (dataProjectConfig_Org.eof) then
                begin
                  bNoChild := true ;
                end ;
                sLabel := dataOrganizationORGNAME.asString;
                if dataOrganizationPARENT_ID.AsInteger > 0 then
                begin
                     // organizations
                      sLabel := sLabel +' (child org)';
                end else
                begin

                      bDefaultOrg := true;
                end;
                 tNode :=  TreeView_Project.Items.AddChild(tRoot, sLabel);
                with DBTreeNode(tNode) do
                begin
                    dbkey := dataOrganizationORGANIZATION_ID.AsInteger;
                    dbkey2 := -1 ;
                    dbtablename := 'CORE_ORGANIZATION';
                    dbdataset := DM_Main.dataOrganization ;
                    dbKeyField:= 'ORGANIZATION_ID';
                end  ;
                tNodeCurrent := tNode;


                if bNoChild then
                    tNodeCurrent.ImageIndex:= 3
                else
                   tNodeCurrent.ImageIndex:= 2;

                tNodeCurrent.SelectedIndex:= 0;

                if bDefaultOrg then
                begin
                   tNodeCurrent.ImageIndex := 17;
                   tNodeCurrent.SelectedIndex:= 17;
                    tNodeCurrent.Expanded:= true;
                    tNodeCurrent.Expand(true);

                end;


                if bNoChild = False then
                begin
                   //LEVEL 2
                   While NOT dataProjectConfig_Org.EOF do
                   begin
                       // dataProjectConfig_Org.FieldByName('PRODUCTCODE').AsString;

                        bProjectActive := dataProjectConfig_Org.FieldByName('projIsActive').AsBoolean;
                        bProjectConfigActive:= dataProjectConfig_Org.FieldByName('isActive').AsBoolean;
                        bProjectConfigIsClosed :=  dataProjectConfig_Org.FieldByName('isclosed_flg').AsBoolean;


                       if NOT ( (bDefaultOrg = true) and (bProjectActive = false)) then
                       begin
                        sLabel :=  '['+dataProjectConfig_Org.FieldByName('PRODUCTCODE').AsString+':';
                        sLabel := sLabel +  dataProjectConfig_Org.FieldByName('Version').AsString+'] ' ;
                        sLabel := sLabel +  dataProjectConfig_Org.FieldByName('ProjectName').AsString ;
                        tNodeChild := TreeView_Project.Items.AddChild(tnode,sLabel );
                        tNodeCurrent := tNodeChild ;

                         if bProjectConfigIsClosed then
                         begin
                          //tNodeCurrent.ImageIndex:= 18;

                         end else
                         begin
                              tNodeCurrent.ImageIndex:= 18;
                              tNodeCurrent.selectedIndex:= 17;
                         end;
                          with DBTreeNode(tNodeCurrent) do
                          begin
                            dbkey := dataProjectConfig_Org.FieldByName('projectconfig_id').asinteger ;
                            dbkey2 := dataProjectConfig_Org.FieldByName('projectconfig_id').asinteger ;
                            dbtablename := 'CORE_PROJECTCONFIG';
                            dbdataSet := dataProjectConfig_Org ;
                            dbKeyField:= 'projectconfig_id';
                          end  ;

                        end;  //NOT ( (bDefaultOrg = true) and (bProjectActive = false))
                        dataProjectConfig_Org.next ;
                    end;
                end;  //dataProjectConfig_Org.eof
              dataOrganization.next ;
         end; //org.eof

    end; //with dm_main

       tRoot.Expanded:= true ;
   tRoot.Expand(false);

    TreeView_Project.Selected := nil ;
   TreeView_Project.EndUpdate;
   DM_Main.dataOrganization.first;
   TreeView_Project.Selected := nil ;     // to avoid an error

  // DM_Main.dataProjectConfig.active := true ;
   // DM_Main.dataAccount.Filtered := false;



end;
procedure Tfrm_Main.Button3Click(Sender: TObject);
var
   jData : TJSONData;
   jObject : TJSONObject;
   jArray : TJSONArray;
   s : string;
begin


   jData := GetJSON('{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}');

   // output as a flat string
   s := jData.AsJSON;

   //  output as nicely formatted JSON
   s := jData.FormatJSON;

   // cast as TJSONObject to make access easier
   jObject := TJSONObject(jData);

   // retrieve value of Fld1
   s := jObject.Get('Fld1');

   // change value of Fld2
   jObject.Integers['Fld2'] := 123;

   // retrieve the second color
   s := jData.FindPath('Colors[1]').AsString;

   // add a new element
   jObject.Add('Happy', True);

   // add a new sub-array
   jArray := TJSONArray.Create;
   jArray.Add('North');
   jArray.Add('South');
   jArray.Add('East');
   jArray.Add('West');
   jObject.Add('Directions', jArray);
   ShowJsonDocument(jData);
end;


procedure Tfrm_Main.ShowJSONDocument(jData : TJSONData);

begin
  With TVJSON.Items do
    begin
    BeginUpdate;
    try
      TVJSON.Items.Clear;
      SHowJSONData(Nil,jData);
      With TVJSON do
        If (Items.Count>0) and Assigned(Items[0]) then
          begin
          Items[0].Expand(False);
          Selected:=Items[0];
          end;
    finally
      EndUpdate;
    end;
    end;
end;

procedure Tfrm_Main.ShowJSONData(AParent : TTreeNode; Data : TJSONData);

Var
  N,N2 : TTreeNode;
  I : Integer;
  D : TJSONData;
  C : String;
  S : TStringList;

begin
  N:=Nil;
  if Assigned(Data) then
    begin
    Case Data.JSONType of
      jtArray,
      jtObject:
        begin
        If (Data.JSONType=jtArray) then
          C:=SArray
         else
           C:=SObject;
        N:=TVJSON.Items.AddChild(AParent,Format(C,[Data.Count]));
        S:=TstringList.Create;
        try
          For I:=0 to Data.Count-1 do
            If Data.JSONtype=jtArray then
              S.AddObject(IntToStr(I),Data.items[i])
            else
              S.AddObject(TJSONObject(Data).Names[i],Data.items[i]);
          If FSortObjectMembers and (Data.JSONType=jtObject) then
            S.Sort;
          For I:=0 to S.Count-1 do
            begin
            N2:=TVJSON.Items.AddChild(N,S[i]);
            D:=TJSONData(S.Objects[i]);
            N2.ImageIndex:=ImageTypeMap[D.JSONType];
            N2.SelectedIndex:=ImageTypeMap[D.JSONType];
            ShowJSONData(N2,D);
            end
        finally
          S.Free;
        end;
        end;
      jtNull:
        N:=TVJSON.Items.AddChild(AParent,SNull);
    else
      N:=TVJSON.Items.AddChild(AParent,Data.AsString);
    end;
    If Assigned(N) then
      begin
      N.ImageIndex:=ImageTypeMap[Data.JSONType];
      N.SelectedIndex:=ImageTypeMap[Data.JSONType];
      N.Data:=Data;
      end;
    end;
end;

procedure Tfrm_Main.TreeView_AcctOrgProjChange(Sender: TObject; Node: TTreeNode);
var
 table : string ;
 key : integer ;
 dataSet : TDataSet ;
 keyfield : string ;
 nextnode, parentnode, childnode : TTreeNode;

 i, iL : integer ;
 bFound : boolean ;
 treeList: TFPObjectList ;
begin
 // level 1:  dataAccount
  // level 2:   dataOrganization
  // level 3:     dataProjectConfig_Org

pnlOrgInfo.visible := false ;
if node <> nil then
begin
  nextnode  := node.GetNextSkipChildren;

  MenuItem_EditAccount.Enabled := false ;
  MenuItem_EditOrg.enabled := false;
  MenuItem_EditProject.enabled := false ;
  MenuItem_NewAccount.enabled := false ;
  MenuItem_NewOrganization.enabled := false ;
  MenuItem_NewProject.enabled := false ;

    if nextnode <> nil then
    nextnode.MakeVisible;


  if node.Level >= 0 then
  begin
        MenuItem_NewAccount.enabled := true ;

  end;

  if node.Level >= 1 then
  begin
         MenuItem_EditAccount.Enabled := true ;
         MenuItem_NewOrganization.enabled := true ;
         MenuItem_NewProject.enabled := true ;


  end;
  if node.level >= 2 then
  Begin
      MenuItem_EditOrg.enabled := true ;
      pnlOrgInfo.visible := true ;

  end;
  if node.Level > 2 then
     MenuItem_EditProject.Enabled := false else
     MenuItem_EditProject.Enabled := false;

  //if node.Level = 0 then
  //begin
  //    if  node.HasChildren then
  //    begin
  //      MenuItem_EditProject.enabled := true ;
  //
  //    end else
  //    begin
  //      MenuItem_EditProject.enabled := false ;
  //
  //    end;
  //end;

 // after recreating tree, node becomes nil

  table :=   DBTreeNode(node).dbtablename;
  key :=      DBTreeNode(node).dbkey;
  dataSet :=  DBTreeNode(node).dbdataset;
  keyfield :=    DBTreeNode(node).dbKeyField;

  if table <> '' then
  begin
      bFound := dataSet.Locate(keyfield,key,[]);
      if not (bFound) then
      try
         // go back through tree to get correct parent/child database relationship

          treeList := TFPObjectList.Create(false);

          iL := node.Level ;

        for i := iL downto 1 do
        begin
            if i = iL then
              nextNode := node else
              nextNode := nextNode.Parent;
              treeList.Add(nextNode);
        end;
        For i := treelist.Count-1 downto 0 do
        begin;
           nextnode := treeList.Items[i] AS TTreeNode;


           table :=   DBTreeNode(nextnode).dbtablename;
           key :=      DBTreeNode(nextnode).dbkey;
           dataSet :=  DBTreeNode(nextnode).dbdataset;
           keyfield :=    DBTreeNode(nextnode).dbKeyField;
           if table <> '' then
           begin
              bFound := dataSet.Locate(keyfield,key,[]);
              if not bFound then
                 showMessage('ERROR: not found '+keyfield+' '+table);
           end;
        end;


      finally
         //treeList.Destroy;
         treeList.Free ;
      end;

  end;
    if node.level = 0 then
   begin
         TreeView_Project.Items.Clear;
        TreeView_Project.Items.FreeAllNodeData;

   end;
   if node.level = 1 then
   begin
   //!!!!!   LoadOrgProjectIntoTree();
       if  TreeView_Project.items.count > 0 then
       begin
         if DBTreeNode(TreeView_Project.Items.GetFirstNode).dbKey <> DM_Main.dataAccountACCOUNT_ID.asInteger then
          LoadProjectIntoTree();
       end else
       LoadProjectIntoTree();

   end;
 end;
end;
procedure Tfrm_Main.LoadAcctOrgProjIntoTree();
var
   tRoot, tNode , tNodeSib, tNodeChild, tNodeSelected, tNodeCurrent, tNodeOrg : TTreeNode ;
   bNoChild : boolean;
   iLoop : integer ;
begin
  // level 1:  dataAccount
  // level 2:   dataOrganization
  // level 3:     dataProjectConfig_Org
   updateFromTree:= false;
   bLoadOrgTree:= false ;
   with DM_Project do
   begin
     dataProjectConfig_Org.active := true;
    //dataOrg_wProject.active := true;
    //dataProjectConfig.active := false ;
   end;
    TreeView_Project.items.clear;
    TreeView_Project.Items.FreeAllNodeData ;

    TreeView_AcctOrgProj.Items.Clear;
    TreeView_AcctOrgProj.Items.FreeAllNodeData;

    TreeView_AcctOrgProj.BeginUpdate;
   //   tNodeSelected := TreeView_AcctOrgProj.Selected;
          dbgrid5.BeginUpdate;

  For iLoop := 0 to 2 do
  begin
    if iLoop = 0 then
       tRoot := TreeView_AcctOrgProj.Items.Add(nil,'Account, Organization, Projects') ;
     if iLoop = 1 then
       tRoot := TreeView_AcctOrgProj.Items.Add(nil,'Accounts (no Project)');
    if iLoop = 2 then
      tRoot := TreeView_AcctOrgProj.Items.Add(nil,'Inactive Accounts');

    with DBTreeNode(tRoot) do
     begin
         dbkey := -1;
         dbkey2 := -1 ;
         dbtablename := '';
         dbdataset := DM_Main.dataAccount ;
         dbKeyField:= '';
     end  ;


    With DM_Main, DM_Project do
    begin
      dataAccount.Filtered := true;
      if iLoop = 0 then
      begin
       // dataAccount.DisableControls;
        dataAccount.Filter := 'isinactive = 0';

      end;
        if iLoop = 1 then
        begin
          dataAccount.DisableControls;
          dataAccount.Filter:= 'isinactive = 0';

        end;
        if iLoop = 2 then
        begin
         // dataAccount.DisableControls;
          dataAccount.Filter:= 'isinactive = 1';

        end;

          dataAccount.first ;
          While NOT dataAccount.eof do
          begin
           bNoChild := False ;
           if (dataProject.RecordCount <= 0) then
           begin
                bNoChild := true ;
           end ;

              if (bNoChild = false ) AND (iLoop = 0) or (iLoop = 2) then
              begin
                 //  dataOrg_wProject.active := true;

                   // LEVEL 1
                   tNode :=  TreeView_AcctOrgProj.Items.AddChild(tRoot, dataAccountACCOUNTNAME.asString);
                   with DBTreeNode(tNode) do
                   begin
                       dbkey := dataAccountACCOUNT_ID.AsInteger;
                       dbkey2 := -1 ;
                       dbtablename := 'CORE_ACCOUNT';
                       dbdataset := DM_Main.dataAccount ;
                       dbKeyField:= 'ACCOUNT_ID';
                   end  ;
                   tNodeCurrent := tNode;
                    if bNoChild then
                     tNodeCurrent.ImageIndex:= 3
                    else
                     tNodeCurrent.ImageIndex:= 2;

                    tNodeCurrent.SelectedIndex:= 0;
                 // LEVEL 2
                 dataOrganization.first ;
                 While NOT dataOrganization.EOF do
                  begin
                       tNodeChild := TreeView_AcctOrgProj.Items.AddChild(tnode, 'ORG: '+dataOrganizationORGNAME.AsString+'') ;
                       tNodeCurrent := tNodeChild ;

                     if dataOrganizationISINACTIVE.asInteger  = 1 then
                     begin
                      //tNodeCurrent.ImageIndex:= 18;

                     end else
                     begin
                          tNodeCurrent.ImageIndex:= 18;
                          tNodeCurrent.selectedIndex:= 17;
                     end;
                      with DBTreeNode(tNodeCurrent) do
                      begin
                          dbkey := dataOrganizationORGANIZATION_ID.AsInteger;
                           dbkey2 := dataProjectACCOUNT_ID.AsInteger ;
                           dbtablename := 'CORE_ORGANIZATION';
                           dbdataSet := dataOrganization ;
                           dbKeyField:= 'Organization_ID';


                      end  ;
                      //LEVEL 3
                       WITH dataProjectConfig_Org do
                       BEGIN
                         First ;
                         While Not EOF do
                         begin
                              tNodeChild := TreeView_AcctOrgProj.Items.AddChild(tNodeCurrent, 'PROJECT: '+FieldByName('PROJECTNAME').AsString);
                              tNodeOrg := tNodeChild ;
                              with DBTreeNode(tNodeOrg) do
                              begin
                                dbkey := fieldbyname('ProjectConfig_ID').AsInteger;
                                dbkey2 := fieldbyname('Project_ID').AsInteger ;
                                 dbtablename := 'CORE_PROJECTCONFIG';
                                dbdataSet := dataProjectConfig_Org;
                                dbKeyField:= 'ProjectConfig_ID';

                              end  ;
                              NEXT ;
                         end;   //dataProjectConfig_Org.eof
                        end;   //WITH dataProjectConfig_Org do

                     dataOrganization.NEXT;
                  end; //dataOrganization.EOF
              end else
              begin
                  //  if (bNoChild = true ) and (iLoop = 1) then
                  if (iLoop >= 1) then
                    begin
                        tNode :=  TreeView_AcctOrgProj.Items.AddChild(tRoot, dataAccountACCOUNTNAME.asString);
                        with DBTreeNode(tNode) do
                        begin
                           dbkey := dataAccountACCOUNT_ID.AsInteger;
                           dbkey2 := -1 ;
                           dbtablename := 'CORE_ACCOUNT';
                           dbdataset := DM_Main.dataAccount ;
                           dbKeyField:= 'ACCOUNT_ID';


                        end  ;
                        tNodeCurrent := tNode;
                        if bNoChild then
                         tNodeCurrent.ImageIndex:= 3
                        else
                         tNodeCurrent.ImageIndex:= 2;

                        tNodeCurrent.SelectedIndex:= 0;
                    end; // iLoop 1
              end;

              dataAccount.Next;
          end; // dataAccount.EOF
          dataAccount.EnableControls;

    end; //with DM_DataMain
  end;   //iloop


    //     tNode :=  TreeView_AcctOrgProj.Items.AddFirst(tNodeSelected,'First');
         //tNodeChild := TreeView_AcctOrgProj.Items.AddChild(tnode, 'Child');
         // with DBTreeNode(tNodeChild) do
         // begin
         //         dbkey := 2 ;
         //         //dbTable := 'Child';
         //end ;

         TreeView_AcctOrgProj.Selected := nil ;
        TreeView_AcctOrgProj.EndUpdate;

         dbgrid5.EndUpdate;
         //
       DM_Main.dataAccount.first;
       TreeView_AcctOrgProj.Selected := nil ;     // to avoid an error

    DM_Project.dataProjectConfig.active := true ;
    DM_Main.dataAccount.Filtered := false;
    bLoadOrgTree:= true;



end;
procedure Tfrm_Main.LoadProjectIntoTree();
var
   tRoot, tNode , tNodeSib, tNodeChild, tNodeSelected, tNodeCurrent, tNodeOrg : TTreeNode ;
   bNoChild : boolean;
   iLoop : integer ;
   sLabel : string ;
   bDefaultOrg : boolean;
   bProjectConfigActive : boolean ;
   bProjectConfigIsClosed : boolean ;
   bProjectActive : boolean ;
begin
   // level 1 = DM_Project.dataProject
   // level 2  DM_Project.sqlProjectConfig_OrgInfo
   //   linked to Project, :organization_id is
   updateFromTree:= false;
   with DM_Main, DM_Project do
   begin
    sqlProjectConfig_OrgInfo.active := true;


    TreeView_Project.Items.Clear;
    TreeView_Project.Items.FreeAllNodeData;
    tRoot := TreeView_Project.Items.Add(nil,'Project | Organizations for '+dataaccountaccountname.asString) ;
    TreeView_Project.BeginUpdate;
    with DBTreeNode(tRoot) do
     begin
         dbkey := DM_Main.dataAccountACCOUNT_ID.asInteger ;
         dbkey2 := -1 ;
         dbtablename := 'dataAccount';
         dbdataset := DM_Main.dataAccount ;
         dbKeyField:= 'account_id';
     end  ;
    With DM_Project, DM_Project.dataProject do
    begin
         first ;
         while not eof do
         begin
                // LEVEL 1
                bNoChild := False ;
                bDefaultOrg := false ;
                if (sqlProjectConfig_OrgInfo.recordcount <= 0) then
                begin
                  bNoChild := true ;
                end ;
                  sLabel :=  FieldByName('ProjectName').AsString ;
                //  sLabel :=  sLabel + ' Code|Version: ';
              //  sLabel := dataProjectPROJECTNAME.asString;
                   sLabel := sLabel + ' ['+FieldByName('PRODUCTCODE').AsString+':';
                   sLabel := sLabel +  FieldByName('Version').AsString+'] ' ;
               //    sLabel := sLabel +  FieldByName('ProjectName').AsString ;
                tNode :=  TreeView_Project.Items.AddChild(tRoot, sLabel);
                with DBTreeNode(tNode) do
                begin
                    dbkey := dataProjectPROJECT_ID.AsInteger;
                    dbkey2 := dataProjectACCOUNT_ID.AsInteger;
                    dbtablename := 'CORE_PROJECT';
                    dbdataset := DM_Project.dataProject ;
                    dbKeyField:= 'PROJECT_ID';
                end  ;
                tNodeCurrent := tNode;

                tNodeCurrent.ImageIndex:= 18;
                tNodeCurrent.selectedIndex:= 17;

                if bNoChild then
                   // tNodeCurrent.ImageIndex:= 3
                else
                  // tNodeCurrent.ImageIndex:= 2;

                //tNodeCurrent.SelectedIndex:= 0;

                if bNoChild = False then
                begin
                   //LEVEL 2
                   WITH DM_PROJECT.sqlProjectConfig_OrgInfo do
                   BEGIN

                   While NOT EOF do
                   begin
                       // dataProjectConfig_Org.FieldByName('PRODUCTCODE').AsString;

                        bProjectActive := DM_project.dataProject.FieldByName('IsActive').AsBoolean;
                        bProjectConfigActive:= FieldByName('isActive').AsBoolean;
                        bProjectConfigIsClosed :=  FieldByName('isclosed_flg').AsBoolean;


                       if NOT ( (bProjectActive = false)) then
                       begin
                         if fieldByName('Organization_ID').IsNull then
                         begin
                          sLabel := ''+fieldByName('Orgname').AsString  ;
                          bDefaultOrg := true ;
                         end  else
                         begin
                          sLabel := 'ORG: '+fieldByName('Orgname').AsString ;
                           bDefaultOrg := false ;
                         end;
                         //orgfullname
                        tNodeChild := TreeView_Project.Items.AddChild(tnode,sLabel );
                        tNodeCurrent := tNodeChild ;

                         if bProjectConfigIsClosed then
                         begin
                          //tNodeCurrent.ImageIndex:= 18;

                         end else
                         begin
                            tNodeCurrent.ImageIndex:= 2;
                            tNodeCurrent.SelectedIndex:= 0;
                         end;
                           if bDefaultOrg then
                           begin
                               tNodeCurrent.ImageIndex := 20;
                               tNodeCurrent.SelectedIndex:= 19;


                           end;

                          with DBTreeNode(tNodeCurrent) do
                          begin
                            dbkey := FieldByName('projectconfig_id').asinteger ;
                            dbkey2 := FieldByName('organization_id').asinteger ;
                            dbtablename := 'CORE_PROJECTCONFIG';
                            dbdataSet := sqlProjectConfig_OrgInfo ;
                            dbKeyField:= 'projectconfig_id';
                          end  ;

                        end;  //NOT (bProjectActive = false)
                        NEXT;
                      end; //eof
                      END;  //WITH DM_PROJECT.sqlProjectConfig_OrgInfo

                   end;  //no child

              NEXT ;
         end; //project.eof

    end; //with dm_project

   tRoot.Expanded:= true ;
   tRoot.Expand(false);

    TreeView_Project.Selected := nil ;
   TreeView_Project.EndUpdate;
   DM_Project.dataProject.first;
   TreeView_Project.Selected := nil ;     // to avoid an error
     end;


end;
FUNCTION Tfrm_Main.resourceVersionInfo: STRING;

 (* Unlike most of AboutText (below), this takes significant activity at run-    *)
 (* time to extract version/release/build numbers from resource information      *)
 (* appended to the binary.                                                      *)

 VAR     Stream: TResourceStream;
         vr: TVersionResource;
         fi: TVersionFixedInfo;

 BEGIN
   RESULT:= '';
   TRY

 (* This raises an exception if version info has not been incorporated into the  *)
 (* binary (Lazarus Project -> Project Options -> Version Info -> Version        *)
 (* numbering).                                                                  *)

     Stream:= TResourceStream.CreateFromID(HINSTANCE, 1, PChar(RT_VERSION));
     TRY
       vr:= TVersionResource.Create;
       TRY
         vr.SetCustomRawDataStream(Stream);
         fi:= vr.FixedInfo;
         RESULT := 'Version ' + IntToStr(fi.FileVersion[0]) + '.' + IntToStr(fi.FileVersion[1]) +
                ' release ' + IntToStr(fi.FileVersion[2]) + ' build ' + IntToStr(fi.FileVersion[3]) ;
         vr.SetCustomRawDataStream(nil)
       FINALLY
         vr.Free
       END
     FINALLY
       Stream.Free
     END
   EXCEPT
   END
 END { resourceVersionInfo } ;
end.

