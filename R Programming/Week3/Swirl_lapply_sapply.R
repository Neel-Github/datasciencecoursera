 head(flags)
dim(flags) 
 viewinfo(flags)
 class(flags)
 as.list(flags)
cls_list <- lapply(flags, class) 
cls_list 
class(cls_list)
 as.character(cls_list)
cls_vect <- sapply(flags, class) 
class(cls_vect) 
 sum(flags$orange)
flag_colors <- flags[ ,11:17] 
head(flag_colors) 
  lapply(flag_colors, sum) 
  sapply(flag_colors, sum) 
sapply(flag_colors, mean)  
flag_shapes <- flags[ , 19:23]  
lapply(flag_shapes, range)
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)
unique(c(3, 4, 5, 5, 5, 6, 6))
unique_vals <- lapply(flags, unique)
unique_vals
length(unique_vals)
sapply(unique_vals, length)
sapply(flags, unique)
  lapply(unique_vals, function(elem) elem[2])
2
neeldeshmukh619@gmail.com  
