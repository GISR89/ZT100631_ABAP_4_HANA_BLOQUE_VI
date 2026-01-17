@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALV IDA'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_SFLIGHT_0631
  with parameters
    p_Carrid : s_carr_id,
    p_Connid : s_conn_id
  as select from sflight
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
      @Semantics.amount.currencyCode: 'Currency'
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      @Semantics.amount.currencyCode: 'Currency'
      paymentsum as Paymentsum,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF,
      num_puerta as NumPuerta

}
where
      carrid = $parameters.p_Carrid
  and connid = $parameters.p_Connid;
