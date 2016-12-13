public enum MonthEnum {
    JANUARY('January'),
    FEBRUARY('February'),
    MARCH('March'),
    APRIL('April'),
    MAY('May'),
    JUNE('June'),
    JULY('July'),
    AUGUST('August'),
    SEPTEMBER('September'),
    OCTOBER('October'),
    NOVEMBER('November'),
    DECEMBER('December')

    final name

    private MonthEnum(name){
        this.name = name
    }

}