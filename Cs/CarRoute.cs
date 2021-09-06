using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CarRoute : MonoBehaviour
{
    public List<Transform> cwps;
    public List<Transform> route;
    public int routeNumber = 0;
    public int targetWP = 0;

    bool shouldMove = true;

    

    public Rigidbody rb;


    //Adding extra cars

    public bool go = false;
    public float initialDelay;
   

    // Start is called before the first frame update
    void Start()
    {
        cwps = new List<Transform>();
        GameObject wp;

        wp = GameObject.Find("CWP1");
        cwps.Add(wp.transform);

        wp = GameObject.Find("CWP2");
        cwps.Add(wp.transform);

        wp = GameObject.Find("CWP3");
        cwps.Add(wp.transform);

        wp = GameObject.Find("CWP4");
        cwps.Add(wp.transform);

        rb = GetComponent<Rigidbody>();

        SetRoute();

        initialDelay = Random.Range(10.0f, 40.0f);
        transform.position = new Vector3(0.0f, -5.0f, 0.0f);
    }

    // Update is called once per frame
    void FixedUpdate()
    {

        if (!go)
        {
            initialDelay -= Time.deltaTime;
            if (initialDelay <= 0.0f)
            {
                go = true;
                SetRoute();
            }
            else return;
        }


        Vector3 displacement = route[targetWP].position - transform.position;
        displacement.y = 0;
        float dist = displacement.magnitude;

        if (dist < 0.1f)
        {
            targetWP++;
            if (targetWP >= route.Count)
            {
                SetRoute();
                return;
            }
        }

        if (shouldMove)
        {
            //calculate velocity for this frame
            Vector3 velocity = displacement;
            velocity.Normalize();
            velocity *= 7.5f;
            //apply velocity
            Vector3 newPosition = transform.position;
            newPosition += velocity * Time.deltaTime;
            rb.MovePosition(newPosition);

            //align to velocity
            Vector3 desiredForward = Vector3.RotateTowards(transform.forward, velocity,
            10.0f * Time.deltaTime, 0f);
            Quaternion rotation = Quaternion.LookRotation(desiredForward);
            rb.MoveRotation(rotation);
        }
        

    }

    void SetRoute()
    {
        //randomise the next route
        routeNumber = Random.Range(0, 3);
        //set the route waypoints
        if (routeNumber == 0) route = new List<Transform> { cwps[0], cwps[1]};
        else if (routeNumber == 1) route = new List<Transform> { cwps[2], cwps[3]};
        else if (routeNumber == 2) route = new List<Transform> { cwps[2], cwps[3]};
        

        //initialise position and waypoint counter
        transform.position = new Vector3(route[0].position.x, 0.0f,
        route[0].position.z);

        targetWP = 1;
    }

    void OnTriggerEnter(Collider other)
    {

        //Vector3 displacement = route[targetWP].position - transform.position;
        //displacement.y = 0;
        //float dist = displacement.magnitude;

        ////calculate velocity for this frame
        //Vector3 velocity = displacement;
        //velocity.Normalize();
        //velocity *= 0f;
        ////rb.AddForce(transform.forward * thrust); // Could be used to stop (transform.pause) or something
        ////apply velocity
        //Vector3 newPosition = transform.position;
        //    newPosition += velocity * Time.deltaTime;
        //    rb.MovePosition(newPosition);
        
        shouldMove = false;
        Debug.Log("We hit something.");
    }
    

    void OnTriggerExit()
    {
        shouldMove = true;
        print("No longer in contact");
    }

}






