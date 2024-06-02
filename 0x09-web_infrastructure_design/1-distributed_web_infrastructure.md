Description

This is a distributed web infrastructure that atttempts to reduce the traffic to the primary server by distributing some of the load to a replica server with the aid of a server responsible for balancing the load between the two servers (primary and replica).
Specifics About This Infrastructure

    The distribution algorithm the load balancer is configured with and how it works.
    The HAProxy load balancer is configured with the Round Robin distribution algorithm. This algorithm works by using each server behind the load balancer in turns, according to their weights. It’s also probably the smoothest and most fair algorithm as the servers’ processing time stays equally distributed. As a dynamic algorithm, Round Robin allows server weights to be adjusted on the go.
    The setup enabled by the load-balancer.
    A Primary-Replica setup configures one server to act as the Primary server and the other server to act as a Replica of the Primary server. However, the Primary server is capable of performing read/write requests whilst the Replica server is only capable of performing read requests. Data is synchronized between the Primary and Replica servers whenever the Primary server executes a write operation.
    The difference between the Primary node and the Replica node in regard to the application.
    The Primary node is responsible for all the write operations the site needs whilst the Replica node is capable of processing read operations, which decreases the read traffic to the Primary node.


