New home, new hope
==================

There are many reasons for people to change a place to live.Chaning job,changing children's school,company relocation,seeking quietness or looking for more energetic life,etc..What ever you just need a reason to move.Question is how reasonable your reason can be?

A reasonable reason is not like "I just wanna move but I don't know where and how to go".It should be a plan,a solution to convince you even your family that you really have a right choice.

But how to prove a choice is a right choice? Sometimes you thought you already made a right decision,but serveral years or months or days later,you realized it was a big mistake and you had to do it again. Oh,I need a top level consultant!

Top level consultant is quite expensive.Here,let's make a consulting tool by ourself!

P.S. If I have a good consulting tool, my family would have moved for one time other than two times during past three years.One time means lot lot of time and money!

FindHome v0.01
--------------

For version 0.01 ( we meybe need to upgrate it for 100 times),we firstly focus on one big reason: I'm looking for a new home because I want to change my kids' school!

Changing school? Easy! Here is Us News Top High School Ranking <https://www.usnews.com/education/best-high-schools>. Too academic? How about this one <https://www.niche.com>,it offers all public schools and private schools information,and it has very friendly interface,you even can find safety and real estate information near each school.

Yes,it's good.But I'm not gonna just choose a school by it's ranking.I need job,I need to think over buying house or renting one,I need convienient commercial and public services,I need to find a better life style matched my family.I need a relevant analysis.

I think I need a analysis like below.

### Basic data lists

Considering data collection difficulty,we can focus on one state in USA,for example Washington state.

#### N1. Public\_schools&lt;-list(ranking,name,grade,school\_district,address,students,faculties,academic,ClubsActivities,safety,foods,finance)

Data sources: <https://www.niche.com/k12/search/best-public-schools/s/washington/>

#### N2.Private\_schools&lt;-list(ranking,name,tuition,grade,address,religion,single\_gender,boarding,students,faculties,academic,ClubsActivities,safety,foods,finance)

Data sources: <https://www.niche.com/k12/search/best-private-schools/s/washington/>

#### N3.Job\_market&lt;- list(areas,occupational\_title,estimated\_employment,all\_job\_posting,new\_job\_posting,average\_annual\_wage,percentiles,employers)

Data sources: <https://esd.wa.gov/>

#### N4.Real\_estates&lt;-(market\_value,property\_tax,rent,use\_condition)

Data sources: <https://www.zillow.com/wa/home-values/> <http://realestate.washington.edu/research/wcrer/reports/> <https://dor.wa.gov/about/statistics-reports/local-taxing-district-levy-detail>

#### N5.Community&lt;- list(population,tax,public\_services,commercial\_services,safety)

Data sources: Population: <http://www.ofm.wa.gov/pop/april1/default.asp>

Public Services: It's hard to get detail data sets about public facilities of whole state,or whole county.But we can search "public facilities" by city name in google.Such as below is the search results of seattle: <https://www.google.com/search?biw=1278&bih=655&tbm=lcl&q=public+facilities+in+seattle+wa&oq=public+facilities+in+seattle+wa&gs_l=psy-ab.3...32128.34782.0.35038.15.12.0.0.0.0.347.1021.0j3j0j2.5.0....0...1.1.64.psy-ab..11.0.0....0.P5C_o3k3ip0#rlfi=hd:;si:;mv:!1m3!1d111174.55610396383!2d-122.32938740000002!3d47.612385100000004!2m3!1f0!2f0!3f0!3m2!1i100!2i248!4f13.1;tbs:lrf:!2m1!1e2!2m1!1e3!2m4!1e17!4m2!17m1!1e2!3sIAE,lf:1,lf_ui:2>

Commercial Services: It's a very complicated searching.We need to use quite specific key words to search on yelp or google(yelp maybe better).Such as below: <https://www.yelp.com/search?find_desc=Gymnastics&find_loc=Seattle%2C+WA&ns=1>

Safety: <http://sac.ofm.wa.gov/data> <https://ucr.fbi.gov/crime-in-the-u.s/2015/crime-in-the-u.s.-2015/tables/table-8/table-8-state-pieces/table_8_offenses_known_to_law_enforcement_washington_by_city_2015.xls> <https://www.doh.wa.gov/YouandYourFamily/InjuryandViolencePrevention/Data/WashingtonStateInjuryDataTables>

### Relevant list analysis

When you choose a school,you need to know relevant conditions assessments.Such as "What kind of job I need and I can looking for","How much should I pay annually living here","How about the residential intensity of this area","How convinient according our family living style","How about the safety of this community".

#### Relevant value list

We can build relevant data lists with combination of the five basic lists above,and use these relevant lists to do analysis.We can have two dimentions to combine lists as below.

##### Public school

Public school district will decide residential area.Then it will take effect on your working area and living area.

Probable list combinations are:N1+N3,N1+N4,N1+N5,N1+N3+N4,N1+N3+N5,N1+N4+N5,N1+N3+N4+N5.

##### Private school

Private school location also decide your residential area,but you can be more flexible without limitation in one school district.

Probable list combinations are:N2+N3,N2+N4,N2+N5,N2+N3+N4,N2+N3+N5,N2+N4+N5,N2+N3+N4+N5.

#### Relevant analysis methods

### Plots and Reports

### Conclutions

### Future improvment

Oh,you looks like a data science guy,do it by yourself,keep doing it,you can do it!
