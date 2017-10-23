#Loading the rvest package
library('rvest')
library('stringr')


#Url for best high school in Washingtong state website to be scrapped
high_url_prefix<-'https://www.niche.com/k12/search/best-public-high-schools/s/washington/?page='
high_url_page_first<-'https://www.niche.com/k12/search/best-public-high-schools/s/washington/'
webpage_high<-read_html(high_url_page_first)
page_info<-html_text(html_nodes(webpage_high,'.pagination__pages__selector'))
page_total<-as.numeric(sub('^.* ([[:alnum:]]+)$', '\\1', page_info))
result_info<-html_text(html_nodes(webpage_high,'.search-result-counter'))
result_cnt<-as.numeric(sub("\\s.*","",result_info))
cnt_perpage<-ceiling(result_cnt/page_total)

#Rank,School_Name,School_district,Niche_rating,Students_num,Teacher_ratio

rank_data<-c()
s_name<-c()
s_district<-c()
#grade<-c()
n_rating<-c()
students_num<-c()
teacher_ratio<-c()

for (page_no in 1:page_total){
#for (page_no in 16:16){
  rank_data_page<-c()
  s_name_page<-c()
  s_district_page<-c()
  #grade_page<-c()
  n_rating_page<-c()
  students_num_page<-c()
  teacher_ratio_page<-c()
  
  high_url<-paste(high_url_1,as.character(page_no),sep="")
  webpage_high<-read_html(high_url)
  
  #Scrape School Ranking  
  rank_data_page<-html_text(html_nodes(webpage_high,'.search-result-badge-ordinal'))
  if(length(rank_data_page)<page_total){
    n<-length(rank_data_page)+1
    if(page_no!=page_total){
      k<-cnt_perpage
    }else{
      k<-result_cnt-cnt_perpage*(page_no-1)
    }
    for (i in n:k){
      rank_data_page[i]=NA
    }
   }else{
    rank_data_page<-as.numeric(rank_data_page)
   }
   rank_data<-c(rank_data,rank_data_page)

   #Scrape School Name   
   s_name_page<-html_text(html_nodes(webpage_high,'.search-result-entity-name'))
   s_name<-c(s_name,s_name_page)
   
   
   #School District+Grade: .search-result-tagline__item
   s_dist_grade_page<-html_text(html_nodes(webpage_high,'.search-result-tagline__item'))
   s_dist_grade_page<-s_dist_grade_page[ !grepl("Online|online", s_dist_grade_page)]
   s_dist_grade_page<-s_dist_grade_page[  !s_dist_grade_page %in% c("Public School","Public school","public school")]
   #s_dist_grade_page<-s_dist_grade_page[is.na(as.numeric(s_dist_grade_page)) ]
   s_dist_grade_page<-s_dist_grade_page[!grepl("[[:digit:]]", s_dist_grade_page)]
   s_district<-c(s_district,s_dist_grade_page)
   
   #Scrape Niche Rating
   n_rating_page<-html_text(html_nodes(webpage_high,'.niche__grade'))
   n_rating<-c(n_rating,n_rating_page)
   
   #Scrape Students Number
   students_num_page<-html_text(html_nodes(webpage_high,'.search-result-fact-list__item:nth-child(2) .search-result-fact__value'))
   students_num<-c(students_num,as.numeric(gsub(",","",students_num_page)))
   
   #Scrape Student-Teacher Ratio
   teacher_ratio_page<-html_text(html_nodes(webpage_high,'.search-result-fact-list__item~ .search-result-fact-list__item+ .search-result-fact-list__item .search-result-fact__value'))
   teacher_ratio<-c(teacher_ratio,teacher_ratio_page)
   
}

best_public_high_wa<-data.frame(rank_data,s_name,s_district,n_rating,students_num,teacher_ratio)
write.csv(best_public_high_wa, file = "best_public_high_wa.csv")
