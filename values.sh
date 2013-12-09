#!/bin/sh

export ca_size=8192
export size=8192

export format="PEM"

ca_country_code="FR"
ca_state="France"
ca_locality="Lille"
ca_org="Florent Peterschmitt"
ca_org_unit="Florent Peterschmitt"
ca_common_name="Florent Peterschmitt"
ca_mail="florent@peterschmitt.fr"

export ca_protect="no"
export ca_name="FlorentPeterschmitt"
export ca_days=3650
export ca_subj="/C=${ca_country_code}/ST=${ca_state}/L=${ca_locality}/O=${ca_org}/OU=${ca_org_unit}/CN=${ca_common_name}/emailAddress=${ca_mail}"

country_code="FR"
state="France"
locality="Lille"
org="Florent Peterschmitt"
org_unit="Florent Peterschmitt"
common_name="localhost"
mail="florent@peterschmitt.fr"

export days=365
export subj="/C=${country_code}/ST=${state}/L=${locality}/O=${org}/OU=${org_unit}/CN=${common_name}/emailAddress=${mail}"
