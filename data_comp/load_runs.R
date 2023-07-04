# Combining all runs into single data frames
# Flows 1-7
flow1_all <- data.frame(read.csv('runs_1_250/flow1_1_250.csv'),
                        read.csv('runs_251_500/flow1_251_500.csv'),
                        read.csv('runs_501_750/flow1_501_750.csv'),
                        read.csv('runs_751_1000/flow1_751_1000.csv'),
                        read.csv('runs_1001_1250/flow1_1001_1250.csv'))

flow2_all <- data.frame(read.csv('runs_1_250/flow2_1_250.csv'),
                        read.csv('runs_251_500/flow2_251_500.csv'),
                        read.csv('runs_501_750/flow2_501_750.csv'),
                        read.csv('runs_751_1000/flow2_751_1000.csv'),
                        read.csv('runs_1001_1250/flow2_1001_1250.csv'))

flow3_all <- data.frame(read.csv('runs_1_250/flow3_1_250.csv'),
                        read.csv('runs_251_500/flow3_251_500.csv'),
                        read.csv('runs_501_750/flow3_501_750.csv'),
                        read.csv('runs_751_1000/flow3_751_1000.csv'),
                        read.csv('runs_1001_1250/flow3_1001_1250.csv'))

flow4_all <- data.frame(read.csv('runs_1_250/flow4_1_250.csv'),
                        read.csv('runs_251_500/flow4_251_500.csv'),
                        read.csv('runs_501_750/flow4_501_750.csv'),
                        read.csv('runs_751_1000/flow4_751_1000.csv'),
                        read.csv('runs_1001_1250/flow4_1001_1250.csv'))

flow5_all <- data.frame(read.csv('runs_1_250/flow5_1_250.csv'),
                        read.csv('runs_251_500/flow5_251_500.csv'),
                        read.csv('runs_501_750/flow5_501_750.csv'),
                        read.csv('runs_751_1000/flow5_751_1000.csv'),
                        read.csv('runs_1001_1250/flow5_1001_1250.csv'))

flow6_all <- data.frame(read.csv('runs_1_250/flow6_1_250.csv'),
                        read.csv('runs_251_500/flow6_251_500.csv'),
                        read.csv('runs_501_750/flow6_501_750.csv'),
                        read.csv('runs_751_1000/flow6_751_1000.csv'),
                        read.csv('runs_1001_1250/flow6_1001_1250.csv'))

flow7_all <- data.frame(read.csv('runs_1_250/flow7_1_250.csv'),
                        read.csv('runs_251_500/flow7_251_500.csv'),
                        read.csv('runs_501_750/flow7_501_750.csv'),
                        read.csv('runs_751_1000/flow7_751_1000.csv'),
                        read.csv('runs_1001_1250/flow7_1001_1250.csv'))

# Maxmin pressure
# 1-250 has different column labels, rename
tmp0 <- read.csv('runs_1_250/maxmin_1_250.csv')
colnames(tmp0)[2:3] <- c('max_pressure', 'min_pressure')

# 751-1000 has different column names, rename
tmp <- read.csv('runs_751_1000/maxmin_751_1000.csv')
colnames(tmp) <- c('run_ID', 'max_pressure', 'min_pressure')

# 1001-1250 has different column labels, rename
tmp2 <- read.csv('runs_1001_1250/maxmin_1001_1250.csv')
colnames(tmp2)[2:3] <- c('max_pressure', 'min_pressure')

maxmin_all <- data.frame(rbind(tmp0,
                               read.csv('runs_251_500/maxmin_251_500.csv'),
                               read.csv('runs_501_750/maxmin_501_750.csv'),
                               tmp,
                               tmp2))

rm(tmp0, tmp, tmp2)
