codeunit 50117 WorkDateHandle
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", OnAfterLogin, '', false, false)]
    local procedure "System Initialization_OnAfterLogin"();
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if GeneralLedgerSetup.Get() then
            if GeneralLedgerSetup.DefaultWorkDate <> 0D then
                WorkDate(GeneralLedgerSetup.DefaultWorkDate)
            else
                WorkDate(Today);
    end;
}

tableextension 50117 GeneralLedgerSetupExt extends "General Ledger Setup"
{
    fields
    {
        field(50100; DefaultWorkDate; Date)
        {
            Caption = 'Default Work Date';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 50117 GeneralLedgerSetupExt extends "General Ledger Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field(DefaultWorkDate; Rec.DefaultWorkDate)
            {
                ApplicationArea = All;
                Caption = 'Default Work Date';
            }

        }
    }
}
