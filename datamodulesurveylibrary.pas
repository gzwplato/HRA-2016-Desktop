unit datamoduleSurveyLibrary;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DataModuleMain, db, Ora, OraScript,paswstring ;

type

  { TDM_SurveyLibrary }

  TDM_SurveyLibrary = class(TDataModule)
    dataItem: TOraQuery;
    dataItemCOPYFROMSTDCATEGORY: TIntegerField;
    dataItemCOPYFROMSTDCATEGORY1: TFloatField;
    dataItemCORESET: TIntegerField;
    dataItemCREATED_BY: TStringField;
    dataItemCREATE_DT: TDateTimeField;
    dataItemDATA_FIELDNAME: TStringField;
    dataItemDATA_POSITION: TFloatField;
    dataItemDELETE_FLG: TIntegerField;
    dataItemDESCRIPTION: TStringField;
    dataItemDISPLAYORDER: TFloatField;
    dataItemDOMAIN: TStringField;
    dataItemDOMAINORDER: TFloatField;
    dataItemFIELDNAME: TStringField;
    dataItemISCALCULATED: TIntegerField;
    dataItemISCUSTOM: TIntegerField;
    dataItemISLOCKED: TIntegerField;
    dataItemISSCALE: TIntegerField;
    dataItemITEMLINK_ID: TFloatField;
    dataItemITEMTYPE_ID: TFloatField;
    dataItemITEM_ID: TFloatField;
    dataItemITEM_ORDER: TStringField;
    dataItemITEM_VERSION: TIntegerField;
    dataItemLabelITEMLABEL_ID: TFloatField;
    dataItemLabelITEM_ID: TFloatField;
    dataItemLabelLABEL: TStringField;
    dataItemLabelLABELINPUT: TStringField;
    dataItemLabelLABELINSTRUCTION: TStringField;
    dataItemLabelLABELINSTRUCTION_METRIC: TStringField;
    dataItemLabelLABELLEFT: TStringField;
    dataItemLabelLABELREPORT: TStringField;
    dataItemLabelLABELRIGHT: TStringField;
    dataItemLabelLABELSHORT: TStringField;
    dataItemLabelLABEL_METRIC: TStringField;
    dataItemLabelLANGUAGE_ID: TFloatField;
    dataItemMAPTO_ITEM_ID: TFloatField;
    dataItemMAXVALUE: TFloatField;
    dataItemMEASUREMENTUNIT: TIntegerField;
    dataItemMINVALUE: TFloatField;
    dataItemNOTES: TStringField;
    dataItemORGANIZATION_ID: TFloatField;
    dataItemPAGEORDER: TFloatField;
    dataItemSECTIONORDER: TFloatField;
    dataItemSG_OPTIONID: TFloatField;
    dataItemSG_QID: TFloatField;
    dataItemSTDCATEGORY_ID: TFloatField;
    dataItemSTDORDER: TFloatField;
    dataItemTABLENAME: TStringField;
    dataItemTABLENAMELEGACY: TStringField;
    dataItemTAGS: TStringField;
    dataItemValue: TOraQuery;
    dataItemLabel: TOraQuery;
    dataItemValueCREATED_BY: TStringField;
    dataItemValueCREATE_DT: TDateTimeField;
    dataItemValueDELETE_FLG: TIntegerField;
    dataItemValueDISPLAYORDER: TFloatField;
    dataItemValueISMISSINGVALUE: TFloatField;
    dataItemValueITEMVALUELINK_ID: TFloatField;
    dataItemValueITEMVALUE_ID: TFloatField;
    dataItemValueITEM_ID: TFloatField;
    dataItemValueLabelVALUELABEL_METRIC: TStringField;
    dataItemValueMAPTO_ITEMVALUE: TFloatField;
    dataItemValueMAPTO_ITEMVALUE_ID: TFloatField;
    dataItemValueSG_OPTIONID: TFloatField;
    dataItemValueSG_REPORTINGVALUE: TStringField;
    dataItemValueUPDATED_BY: TStringField;
    dataItemValueUPDATE_DT: TDateTimeField;
    dataItemValueVALUE: TFloatField;
    dataItemVARNAME: TStringField;
    dataItemVIEWNAME: TStringField;
    dataStdCategoryITEMTYPE_ID: TFloatField;
    dataValueAndLabel: TOraQuery;
    dataItemValueLabel: TOraQuery;
    dataItemValueLabelITEMVALUELABEL_ID: TFloatField;
    dataItemValueLabelITEMVALUE_ID: TFloatField;
    dataItemValueLabelLANGUAGE_ID: TFloatField;
    dataItemValueLabelVALUE: TFloatField;
    dataItemValueLabelVALUELABEL: TStringField;
    dataItemValueLabelVALUELABELSHORT: TStringField;
    dataValueAndLabelITEM_ID: TFloatField;
    dataValueAndLabelVALUELABELSHORT: TStringField;
    dataValueAndLabelVALUELABEL_METRIC: TStringField;
    dsOperator_List: TOraDataSource;
    dsOraMetaData: TOraDataSource;
    dsSkipLogic: TOraDataSource;
    luItemType: TOraQuery;
    luItemTypeNODATAFIELD: TFloatField;
    luItemType_forDataItemCREATED_BY: TStringField;
    luItemTypeCREATED_BY1: TStringField;
    luItemType_forDataItemCREATE_DT: TDateTimeField;
    luItemTypeCREATE_DT1: TDateTimeField;
    luItemType_forDataItemDATATYPE: TStringField;
    luItemTypeDATATYPE1: TStringField;
    luItemType_forDataItemDESCRIPTION: TStringField;
    luItemTypeDESCRIPTION1: TStringField;
    luItemType_forDataItemDISPLAYORDER: TFloatField;
    luItemTypeDISPLAYORDER1: TFloatField;
    luItemType_forDataItemHASVALUELIST: TFloatField;
    luItemTypeHASVALUELIST1: TFloatField;
    luItemType_forDataItemISVISIBLE: TFloatField;
    luItemTypeISVISIBLE1: TFloatField;
    luItemType_forDataItemITEMTYPE_ID: TFloatField;
    luItemTypeITEMTYPE_ID1: TFloatField;
    LUValueAndLabel: TOraQuery;
    dataValueAndLabelITEMVALUELABEL_ID: TFloatField;
    dataValueAndLabelITEMVALUE_ID: TFloatField;
    dsItem: TOraDataSource;
    dsItemLabel: TOraDataSource;
    dsluItemType: TOraDataSource;
    luItemType_forDataItem: TOraQuery;
    dataValueAndLabelDISPLAYORDER: TFloatField;
    dataValueAndLabelVALUE: TFloatField;
    dataValueAndLabelVALUELABEL: TStringField;
    dsItemValue: TOraDataSource;
    dsValueAndLabel: TOraDataSource;
    dsItemValueLabel: TOraDataSource;
    dataStdCategory: TOraQuery;
    dataStdCategoryISSCALE: TFloatField;
    dataStdCategoryMAXVALUE: TFloatField;
    dataStdCategoryMINVALUE: TFloatField;
    dataStdCategorySTDCATEGORY_DESC: TStringField;
    dataStdCategorySTDCATEGORY_ID: TFloatField;
    dsStdCategory: TOraDataSource;
    LUValueAndLabelDISPLAYORDER: TFloatField;
    LUValueAndLabelDISPLAYORDER1: TFloatField;
    LUValueAndLabelITEMVALUELABEL_ID: TFloatField;
    LUValueAndLabelITEMVALUELABEL_ID1: TFloatField;
    LUValueAndLabelITEMVALUE_ID: TFloatField;
    LUValueAndLabelITEMVALUE_ID1: TFloatField;
    LUValueAndLabelVALUE: TFloatField;
    LUValueAndLabelVALUE1: TFloatField;
    LUValueAndLabelVALUELABEL: TStringField;
    dsluTableName_Dict: TOraDataSource;
    LUValueAndLabelVALUELABEL1: TStringField;
    dsMasterField: TOraDataSource;
    dsMasterValues: TOraDataSource;
    OraEncryptor1: TOraEncryptor;
    luTableName_Dict: TOraQuery;
    dataSkipLogic: TOraQuery;
    luOperator_List: TOraQuery;
    luMasterField: TOraQuery;
    dataMasterValues: TOraQuery;
    OraMetaData: TOraMetaData;
    vw_SLIB_DATADICT_HRA: TOraQuery;
    OraScript1: TOraScript;
    OraSQL1: TOraSQL;
    OraSQLGeneric: TOraSQL;
    OraStoredProc1: TOraStoredProc;
    sp_CHECKITEMFIELDNAME: TOraStoredProc;
    SP_UPSERT_ITEMMULTI_ITEM: TOraStoredProc;
    SP_Upsert_Item: TOraStoredProc;
    SP_UPSERT_ITEMVALUE: TOraStoredProc;
    SP_UPSERT_ITEMLABEL: TOraStoredProc;
    SP_UPSERT_ITEMMULTI_ITEMVALUE: TOraStoredProc;
    SP_UPSERT_ITEMVALUELABEL: TOraStoredProc;
    procedure dataItemAfterOpen(DataSet: TDataSet);
    procedure dataItemAfterPost(DataSet: TDataSet);
    procedure dataSkipLogicAfterOpen(DataSet: TDataSet);
    procedure luMasterFieldAfterOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM_SurveyLibrary: TDM_SurveyLibrary;

implementation

{$R *.lfm}

{ TDM_SurveyLibrary }

procedure TDM_SurveyLibrary.dataItemAfterPost(DataSet: TDataSet);
begin

end;

procedure TDM_SurveyLibrary.dataSkipLogicAfterOpen(DataSet: TDataSet);
begin
    luOperator_List.active := true;
end;

procedure TDM_SurveyLibrary.luMasterFieldAfterOpen(DataSet: TDataSet);
begin
     dataMasterValues.active := false;
    dataMasterValues.active := true;
end;

procedure TDM_SurveyLibrary.dataItemAfterOpen(DataSet: TDataSet);
begin
   dataSkipLogic.active := false ;
   dataSkipLogic.active := true ;
end;

end.

