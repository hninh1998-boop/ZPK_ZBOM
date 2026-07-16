CLASS lhc_ZBOMHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZBOMHeader RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZBOMHeader RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZBOMHeader.

    METHODS rba_Item FOR READ
      IMPORTING keys_rba FOR READ ZBOMHeader\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Item FOR MODIFY
      IMPORTING entities_cba FOR CREATE ZBOMHeader\_Item.

    METHODS detailViewList FOR MODIFY
      IMPORTING keys FOR ACTION ZBOMHeader~detailViewList RESULT result.

*    METHODS explodezbom FOR MODIFY
*      IMPORTING keys FOR ACTION ZBOMHeader~explodezbom RESULT result.

ENDCLASS.

CLASS lhc_ZBOMHeader IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Item.
  ENDMETHOD.

  METHOD cba_Item.
  ENDMETHOD.

  METHOD detailViewList.
  ENDMETHOD.

*  METHOD explodezbom.
*    DATA: lt_data TYPE TABLE OF ztb_zbom_explode.
*
*    LOOP AT keys INTO DATA(ls_key).
*      DATA(lv_qty) = ls_key-%param-RequiredQuantityHeader.
*      lt_data = VALUE #( BASE lt_data (
*           Bill_Of_Material             = ls_key-BillOfMaterial
*           bill_of_material_category     = ls_key-BillOfMaterialCategory
*           Material                   = ls_key-Material
*           Plant                      = ls_key-Plant
*           bill_of_material_variant_usage = ls_key-BillOfMaterialVariantUsage
*          Sales_Order                 = ls_key-SalesOrder
*          sales_order_item             = ls_key-SalesOrderItem
*           quantity     = lv_qty    " ← set qty vào đây
*           uname = sy-uname
*         )
*       ).
*    ENDLOOP.
*
*    zcl_zbom_buffer=>set_buffer( it_data = lt_data ).
*
*    LOOP AT keys INTO ls_key.
*      result = VALUE #( BASE result (
**    %cid_ref = ls_key-%cid_ref
*    %tky = ls_key-%tky
*    %param = VALUE #(
*      BillOfMaterial             = ls_key-BillOfMaterial
*      BillOfMaterialCategory     = ls_key-BillOfMaterialCategory
*      Material                   = ls_key-Material
*      Plant                      = ls_key-Plant
*      BillOfMaterialVariantUsage = ls_key-BillOfMaterialVariantUsage
*      SalesOrder                 = ls_key-SalesOrder
*      SalesOrderItem             = ls_key-SalesOrderItem
*    )
*  )
*  ).
*
*    ENDLOOP.
*  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZBOMItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZBOMItem RESULT result.

    METHODS rba_Header FOR READ
      IMPORTING keys_rba FOR READ ZBOMItem\_Header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZBOMItem IMPLEMENTATION.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCE_ZBOM_HEADER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCE_ZBOM_HEADER IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    DATA(lv_sysubrc) = zcl_zbom_buffer=>update_to_db( ).
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
