public class GuestReviewProcessor {
    
    
    
    //TO-DO Build out Invocable method processReviews with label and description
    @InvocableMethod(label='Process Guest Reviews' description='Processes guest reviews submitted via the guest review form')
    public static List<GuestReviewResponse> processReviews(List<GuestReviewRequest> requests){

        GuestReviewResponse response = new GuestReviewResponse();
        
        //TO-DO Insert Guest_Review__c record with contact (Contact__c), experience (Experience__c), rating (Rating__c), and review (Comments__c) variables in the processReviews method
        Guest_Review__c guestReview = new Guest_Review__c();
        guestReview.Contact__c = requests[0].contact.Id;
        guestReview.Experience__c = requests[0].experience.Id;
        guestReview.Rating__c = requests[0].rating;
        guestReview.Comments__c = requests[0].review;
        try {
            insert guestReview;
            response.message = 'Guest review submitted successfully.';
        } catch (DmlException e) {
            response.message = 'Error submitting guest review: ' + e.getMessage();
        }

        //TO-DO Add exception handling code with a try-catch block
        
        //[OPTIONAL] Call CampaignMemberController.createCampaignMemberforRelatedCampaigns() in processReviews method 
        
        //TO-DO Set the output variable response.message from GuestReviewResponse
        
        return new List<GuestReviewResponse> { response };
        
    }
    
    public class GuestReviewRequest{
        //TO-DO Build out GuestReviewRequest class with Invocable variables
        
        @InvocableVariable(required=true description='Contact record associated with the review')
        public Contact contact;
        
        @InvocableVariable(required=true description='Experience record associated with the review')
        public Experience__c experience;
        
        @InvocableVariable(required=true description='Review comments provided by the guest')
        public String review;
        
        @InvocableVariable(required=true description='Rating provided by the guest')
        public String rating;
        
    }
    
    
    public class GuestReviewResponse{
        //TO-DO Build out GuestReviewResponse class with Invocable variables
        
        @InvocableVariable(label='status' description='Response message after processing the guest review')
        public String message;
        
    }    
    
}