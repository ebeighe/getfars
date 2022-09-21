-- todo: emergency use

SET search_path to :schema;

CREATE TABLE state (
    state int primary key,
    name text,
    fips char(2)
);

CREATE TABLE accident (
    state integer,  
    statename character varying(127),
    st_case integer PRIMARY KEY,
    ve_total integer,
    ve_forms integer,
    pvh_invl integer,
    peds integer,
    pernotmvit integer,
    permvit integer,
    persons integer,
    county integer,
    countyname  character varying(127),
    city integer,
    cityname  character varying(127),
    day integer,
    dayname  character varying(127),
    month integer,
    monthname  character varying(127),
    year integer,
    day_week integer,
    day_weekname  character varying(127),
    hour integer,
    hourname  character varying(127),
    minute integer,
    minutename  character varying(127),
    nhs integer,
    nhsname  character varying(127),
    route integer,
    routename  character varying(127),
    tway_id text,
    tway_id2 text,
    rur_urb integer,
    rur_urbname  character varying(127),
    func_sys integer,
    func_sysname  character varying(127),
    rd_owner integer,
    rd_ownername  character varying(127),
    milept integer,
    mileptname  character varying(127),
    latitude double precision,
    latitudename  character varying(127),
    longitud double precision,
    longitudname  character varying(127),
    sp_jur integer,
    sp_jurname  character varying(127),
    harm_ev integer,
    harm_evname  character varying(255),
    man_coll integer,
    man_collname  character varying(127),
    reljct1 integer,
    reljct1name  character varying(127),
    reljct2 integer,
    reljct2name  character varying(127),
    typ_int integer,
    typ_intname  character varying(127),
    wrk_zone integer,
    wrk_zonename  character varying(127),
    rel_road integer,
    rel_roadname  character varying(127),
    lgt_cond integer,
    lgt_condname  character varying(127),
    -- weather1 integer,
    -- weather2 integer,
    weather integer,
    weathername  character varying(127),
    sch_bus integer,
    sch_busname  character varying(127),
    rail text,
    railname  character varying(127),
    not_hour integer,
    not_hourname  character varying(127),
    not_min integer,
    not_minname  character varying(127),
    arr_hour integer,
    arr_hourname  character varying(127),
    arr_min integer,
    arr_minname  character varying(127),
    hosp_hr integer,
    hosp_hrname  character varying(127),
    hosp_mn integer,
    hosp_mnname  character varying(127),
    -- cf1 integer,
    -- cf2 integer,
    -- cf3 integer,
    fatals integer,
    drunk_dr integer
);
-- these changes were necessary because data format from NHTSA changed dramatically around 2020 (and reflected back, and data was re-released)
-- when doing copy, needed to set encoding on command: COPY accident FROM '/home/ed/getfars/accident.CSV' DELIMITER ',' encoding 'windows-1251' CSV HEADER;

CREATE TABLE cevent (
    state integer,
    st_case integer,
    eventnum integer,
    vnumber1 integer,
    aoi1 integer,
    soe integer,
    vnumber2 integer,
    aoi2 integer,
    constraint cevent_pk primary key (st_case, eventnum)
);

CREATE TABLE damage (
    state integer,
    st_case integer,
    veh_no integer,
    mdareas integer
);

CREATE TABLE distract (
    state integer,
    st_case integer,
    veh_no integer,
    mdrdstrd integer
);

CREATE TABLE drimpair (
    state integer,
    st_case integer,
    veh_no integer,
    drimpair integer
);

CREATE TABLE factor (
    state integer,
    st_case integer,
    veh_no integer,
    mfactor integer
);

CREATE TABLE maneuver (
    state integer,
    st_case integer,
    veh_no integer,
    mdrmanav integer
);

CREATE TABLE nmcrash (
    state integer,
    st_case integer,
    veh_no integer,
    per_no integer,
    mtm_crsh integer
);

CREATE TABLE nmimpair (
    state integer,
    st_case integer,
    veh_no integer,
    per_no integer,
    nmimpair integer
);

CREATE TABLE nmprior (
    state integer,
    st_case integer,
    veh_no integer,
    per_no integer,
    mpr_act integer
);

CREATE TABLE parkwork (
    state integer,
    st_case integer,
    veh_no integer,
    pve_forms integer,
    pnumoccs integer,
    pday integer,
    pmonth integer,
    phour integer,
    pminute integer,
    pharm_ev integer,
    pman_coll integer,
    ptype integer,
    phit_run integer,
    preg_stat integer,
    powner integer,
    pmake integer,
    pmodel integer,
    pmak_mod integer,
    pbodytyp integer,
    pmodyear integer,
    pvin text,
    pvin_1 text,
    pvin_2 text,
    pvin_3 text,
    pvin_4 text,
    pvin_5 text,
    pvin_6 text,
    pvin_7 text,
    pvin_8 text,
    pvin_9 text,
    pvin_10 text,
    pvin_11 text,
    pvin_12 text,
    ptrailer integer,
    pmcarr_i1 text,
    pmcarr_i2 text,
    pmcarr_id text,
    pgvwr integer,
    pv_config integer,
    pcargtyp integer,
    phaz_inv integer,
    phazplac integer,
    phaz_id integer,
    phaz_cno integer,
    phaz_rel integer,
    pbus_use integer,
    psp_use integer,
    pem_use integer,
    punderide integer,
    pimpact1 integer,
    pveh_sev integer,
    ptowed integer,
    pm_harm integer,
    pveh_sc1 integer,
    pveh_sc2 integer,
    pfire integer,
    pdeaths integer,
    ptrlr1vin text,
    ptrlr2vin text,
    ptrlr3vin text,
    constraint parkwork_pk primary key (st_case, veh_no)
);

CREATE TABLE pbtype (
    state integer,
    st_case integer,
    veh_no integer,
    per_no integer,
    pbptype integer,
    pbage integer,
    pbsex integer,
    pbcwalk integer,
    pbswalk integer,
    pbszone integer,
    pedctype integer,
    bikectype integer,
    pedloc integer,
    bikeloc integer,
    pedpos integer,
    bikepos integer,
    peddir integer,
    bikedir integer,
    motdir integer,
    motman integer,
    pedleg integer,
    pedsnr text,
    pedcgp integer,
    bikecgp integer,
    constraint pbtype_pk primary key (st_case, per_no)
);

CREATE TABLE person (
    state integer,
    st_case integer,
    ve_forms integer,
    veh_no integer,
    per_no integer,
    str_veh integer,
    county integer,
    day integer,
    month integer,
    hour integer,
    minute integer,
    rur_urb integer,
    func_sys integer,
    harm_ev integer,
    man_coll integer,
    sch_bus integer,
    make integer,
    mak_mod integer,
    body_typ integer,
    mod_year integer,
    tow_veh integer,
    spec_use integer,
    emer_use integer,
    rollover integer,
    impact1 integer,
    fire_exp integer,
    age integer,
    sex integer,
    per_typ integer,
    inj_sev integer,
    seat_pos integer,
    rest_use integer,
    rest_mis integer,
    air_bag integer,
    ejection integer,
    ej_path integer,
    extricat integer,
    drinking integer,
    alc_det integer,
    alc_status integer,
    atst_typ integer,
    alc_res integer,
    drugs integer,
    drug_det integer,
    dstatus integer,
    drugtst1 integer,
    drugtst2 integer,
    drugtst3 integer,
    drugres1 integer,
    drugres2 integer,
    drugres3 integer,
    hospital integer,
    doa integer,
    death_da integer,
    death_mo integer,
    death_yr integer,
    death_hr integer,
    death_mn integer,
    death_tm integer,
    lag_hrs integer,
    lag_mins integer,
    p_sf1 integer,
    p_sf2 integer,
    p_sf3 integer,
    work_inj integer,
    hispanic integer ,
    race integer,
    location integer,
    constraint person_pk primary key (st_case, veh_no, per_no)
);

CREATE TABLE safetyeq (
    state integer,
    st_case integer,
    veh_no integer,
    per_no integer,
    nmhelmet integer,
    nmpropad integer,
    nmothpro integer,
    nmrefclo integer,
    nmlight integer,
    nmothpre integer
);

CREATE TABLE vehicle (
    state integer, 			statename character varying(127),
    st_case integer,
    veh_no integer,
    ve_forms integer,
    numoccs integer, 		numoccsname character varying(127),
    day integer,			dayname character varying(127),
    month integer,			monthname character varying(127),
    hour integer,			hourname character varying(127),
    minute integer,			minutename character varying(127),
    harm_ev integer,		harm_evname character varying(127),
    man_coll integer,		man_collname character varying(127),
    unittype integer,		unittypename character varying(127),
    hit_run integer,		hit_runname character varying(127),
    reg_stat integer,		reg_statname character varying(127),
    owner integer,			ownername character varying(127),
    make integer,			makename character varying(127),
    model integer,			modelname character varying(127),
    mak_mod integer,		mak_modname character varying(127),
    body_typ integer,		body_typname character varying(127),
    mod_year integer,		mod_yearname character varying(127),
    vin text,				vinname character varying(127),
    vin_1 text,
    vin_2 text,
    vin_3 text,
    vin_4 text,
    vin_5 text,
    vin_6 text,
    vin_7 text,
    vin_8 text,
    vin_9 text,
    vin_10 text,
    vin_11 text,
    vin_12 text,
    tow_veh integer,		tow_vehname character varying(127),
    j_knife integer,		j_knifename character varying(127),
    mcarr_i1 integer,		mcarr_i1name character varying(127),
    mcarr_i2 text,			mcarr_i2name character varying(127),
    mcarr_id text,			mcarr_idname character varying(127),
    gvwr integer,			gvwrname character varying(127),
    v_config integer,		v_configname character varying(127),
    cargo_bt integer,		cargo_btname character varying(127),
    haz_inv integer,		haz_invname character varying(127),
    haz_plac integer,		haz_placname character varying(127),
    haz_id integer,			haz_idname character varying(127),
    haz_cno integer,		haz_cnoname character varying(127),
    haz_rel integer,		haz_relname character varying(127),
    bus_use integer,		bus_usename character varying(127),
    spec_use integer,		spec_usename character varying(127),
    emer_use integer,		emer_usename character varying(127),
    trav_sp integer,		trav_spname character varying(127),
    underide integer,		underidename character varying(127),
    rollover integer,		rollovername character varying(127),
    rolinloc integer,		rolinlocname character varying(127),
    impact1 integer,		impact1name character varying(127),
    deformed integer,		deformedname character varying(127),
    towed integer,			towedname character varying(127),
    m_harm integer,			m_harmname character varying(127),
    veh_sc1 integer,		veh_sc1name character varying(127),
    veh_sc2 integer,		veh_sc2name character varying(127),
    fire_exp integer,		fire_expname character varying(127),
    dr_pres integer,		dr_presname character varying(127),
    l_state integer,		l_statename character varying(127),
    dr_zip text,			dr_zipname character varying(127),
    l_status integer,		l_statusname character varying(127),
    l_type integer,			l_typename character varying(127),
    cdl_stat integer,		cdl_statname character varying(127),
    l_endors integer,		l_endorsname character varying(127),
    l_compl integer,		l_complname character varying(127),
    l_restri integer,		l_restriname character varying(127),
    dr_hgt integer,			dr_hgtname character varying(127),
    dr_wgt integer,			dr_wgtname character varying(127),
    prev_acc integer,		prev_accname character varying(127),
    prev_sus integer,		prev_susname character varying(127),
    prev_sus1 integer,		prev_sus1name character varying(127),
    prev_sus2 integer,		prev_sus2name character varying(127),
    prev_sus3 integer,		prev_sus3name character varying(127),
    prev_dwi integer,		prev_dwiname character varying(127),
    prev_spd integer,		prev_spdname character varying(127),
    prev_oth integer,		prev_othname character varying(127),
    first_mo integer,		first_moname character varying(127),
    first_yr integer,		first_yrname character varying(127),
    last_mo integer,		last_moname character varying(127),
    last_yr integer,		last_yrname character varying(127),
    speedrel integer,		speedrelname character varying(127),
    dr_sf1 integer,			dr_sf1name character varying(127),
    dr_sf2 integer,			dr_sf2name character varying(127),
    dr_sf3 integer,			dr_sf3name character varying(127),
    dr_sf4 integer,			dr_sf4name character varying(127),
    vtrafway integer,		vtrafwayname character varying(127),
    vnum_lan integer,		vnum_lanname character varying(127),
    vspd_lim integer,		vspd_limname character varying(127),
    valign integer,			valignname character varying(127),
    vprofile integer,		vprofilename character varying(127),
    vpavetyp integer,		vpavetypname character varying(127),
    vsurcond integer,		vsurcondname character varying(127),
    vtrafcon integer,		vtrafconname character varying(127),
    vtcont_f integer,		vtcont_fname character varying(127),
    p_crash1 integer,		p_crash1name character varying(127),
    p_crash2 integer,		p_crash2name character varying(127),
    p_crash3 integer,		p_crash3name character varying(127),
    pcrash4 integer,		pcrash4name character varying(127),
    pcrash5 integer,		pcrash5name character varying(127),
    acc_type integer,		acc_typename character varying(127),
    deaths integer,
    dr_drink integer,		dr_drinkname character varying(127),
    trlr1vin text,			trlr1vinname character varying(127),
    trlr2vin text,			trlr2vinname character varying(127),
    trlr3vin text,			trlr3vinname character varying(127),
	vpicmake text,			vpicmakename character varying(127),
	vpimodel text,			vpimodelname character varying(127),
	vpibodyclass text,		vpibodyclassname character varying(127),
	icfinalbody text, 		icfinalbodyname character varying(127),
	gvwr_from text, 		gvwr_fromname character varying(127),
	gvwr_to text, 			gvwr_toname character varying(127),
	trlr1gvwr text, 		trlr1gvwrname character varying(127),
	trlr2gvwr text, 		trlr2gvwrname character varying(127),
	trlr3gvwr text, 		trlr3gvwrname character varying(127),	
    constraint vehicle_pk primary key (st_case, veh_no)
);

CREATE TABLE vevent (
    state integer,
    st_case integer,
    eventnum integer,
    veh_no integer,
    veventnum integer,
    vnumber1 integer,
    aoi1 integer,
    soe integer,
    vnumber2 integer,
    aoi2 integer,
    constraint vevent_pk primary key (st_case, veh_no, eventnum)
);

CREATE TABLE vindecode (
    state integer,
    st_case integer,
    veh_no integer,
    ncicmake text,
    vinyear integer,
    vehtype text,
    vehtype_t text,
    vinmake_t text,
    vinmodel_t text,
    vintrim_t text,
    vintrim1_t text,
    vintrim2_t text,
    vintrim3_t text,
    vintrim4_t text,
    bodystyl text,
    bodystyl_t text,
    doors integer,
    wheels integer,
    drivwhls integer,
    mfg text,
    mfg_t text,
    displci integer,
    displcc integer,
    cylndrs text,
    cycles integer,
    fuel text,
    fuel_t text,
    fuelinj text,
    fuelinj_t text,
    carbtype text,
    carbtype_t text,
    carbbrls text,
    gvwrange integer,
    gvwrange_t text,
    whlbsh double precision,
    whlblg double precision,
    tiredesc_f text,
    psi_f integer,
    tiresz_f text,
    tiresz_f_t text,
    tiredesc_r text,
    psi_r integer,
    rearsize text,
    rearsize_t text,
    tonrating text,
    shipweight integer,
    msrp integer,
    drivetyp text,
    drivetyp_t text,
    salectry text,
    salectry_t text,
    abs text,
    abs_t text,
    security text,
    security_t text,
    drl text,
    drl_t text,
    rstrnt text,
    rstrnt_t text,
    tkcab text,
    tkcab_t text,
    tkaxlef text,
    tkaxlef_t text,
    tkaxler text,
    tkaxler_t text,
    tkbrak text,
    tkbrak_t text,
    engmfg text,
    engmfg_t text,
    engmodel text,
    tkduty text,
    tkduty_t text,
    tkbedl text,
    tkbedl_t text,
    segmnt text,
    segmnt_t text,
    plant text,
    plntctry_t text,
    plntcity text,
    plntctry text,
    plntstat text,
    plntstat_t text,
    origin text,
    origin_t text,
    dispclmt double precision,
    blocktype text,
    enghead text,
    enghead_t text,
    vlvclndr integer,
    vlvtotal integer,
    engvincd text,
    incomplt boolean,
    battyp text,
    battyp_t text,
    batkwrtg text,
    batvolt double precision,
    supchrgr text,
    supchrgr_t text,
    turbo text,
    turbo_t text,
    engvvt text,
    mcyusage text,
    mcyusage_t text,
    constraint vindecode_pk primary key (st_case, veh_no)
);

CREATE TABLE violatn (
    state integer,
    st_case integer,
    veh_no integer,
    mviolatn integer
);

CREATE TABLE vision (
    state integer,
    st_case integer,
    veh_no integer,
    mvisobsc integer
);

CREATE TABLE vsoe (
    state integer,
    st_case integer,
    veh_no integer,
    veventnum integer,
    soe integer,
    aoi integer,
    constraint vsoe_pk primary key (st_case, veh_no, veventnum)
);
